-- itkovian.net configuration
--
--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative ((<$>))
import qualified Data.Map as M
import           Data.Maybe
import           Data.Monoid         (mappend, mconcat)
import           Hakyll
import           System.FilePath (combine, splitFileName)

--------------------------------------------------------------------------------
-- Post types
data PostType = Regular
              | Paper

determinePostType :: Metadata -> PostType
determinePostType metadata
    | paperSource /= Nothing = Paper
    | otherwise              = Regular
  where paperSource = M.lookup "paper" metadata


--------------------------------------------------------------------------------
-- support for `paper` posts
paperContext :: Context String
paperContext = mconcat
    [ paperTitleContext
    , paperAuthorContext
    , paperAbstractContext
    , paperPDFContext
    ]

paperTitleContext :: Context a
paperTitleContext = field "title" $ \item -> do
    metadata <- getMetadata (itemIdentifier item)
    return $ fromMaybe "Titleless paper" $ M.lookup "title" metadata

paperAuthorContext :: Context a
paperAuthorContext = field "authors" $ \item -> do
    metadata <- getMetadata (itemIdentifier item)
    return $ fromMaybe "Authorless paper" $ M.lookup "authors" metadata

paperAbstractContext :: Context String
paperAbstractContext = field "body" $ return . itemBody

paperPDFContext :: Context a
paperPDFContext = field "pdf" $ \item -> do
    metadata <- getMetadata (itemIdentifier item)
    return $ fromMaybe "No PDF provided" $ M.lookup "pdf" metadata

paperPathFromPost :: Identifier -> Identifier
paperPathFromPost i =
    let v = identifierVersion i
        (_, p) = splitFileName $ toFilePath i
    in setVersion v . fromFilePath $ combine "papers" p

--------------------------------------------------------------------------------
processPost :: Item String -> Metadata -> Compiler (Item String)
processPost post metadata =
    case determinePostType metadata of
        Paper -> do
            let paperCtx = postCtx `mappend`
                    (field "paper" $ \item -> loadSnapshotBody (paperPathFromPost $ itemIdentifier item) "paper-abstract")
            debugCompiler $ "identifier for post = " ++ (show $ paperPathFromPost $ itemIdentifier post)
            applyAsTemplate paperContext post
                >>= loadAndApplyTemplate "templates/post.html" paperCtx
                >>= loadAndApplyTemplate "templates/default.html" paperCtx

        Regular -> return post
                    >>= loadAndApplyTemplate "templates/post.html" postCtx
                    >>= loadAndApplyTemplate "templates/default.html" postCtx

--------------------------------------------------------------------------------
-- The website should show multiple things
-- 1. blog posts. These can be of various kinds, depending on the metadata that is
--    available in the post markdown file. For example, a regular blog post will
--    simply be rendered by the post.html template. However, we may have a paper
--    blog post. In this, we need to include the abstract of the paper and display
--    it in its own <div> container. This paper abstract has to be displayed at a point
--    specified in the blog post, e.g., $paper$ or $abstract$ or whatever. But it should
--    be possible to add text and other stuff before and after the abstract container.
-- 2. publications. This should stand on its own, with a list of publications (alike the
--    blog post archive) where you can click each publication and see the abstract post.
-- 3. other similar stuff, each with its path/sire for storing the data
-- 4. tags based lists
-- 5. ad infinitum
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.markdown", "contact.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- compile the papers to a complete html, this is NOT what we need in the
    -- papers blogpost
    match "papers/*" $ do
        route $ setExtension "html"
        compile $ do
            paper <- pandocCompiler
            return paper
                >>= loadAndApplyTemplate "templates/paper.html" paperContext
                >>= saveSnapshot "paper-abstract"
                >>= loadAndApplyTemplate "templates/default.html" paperContext
                >>= relativizeUrls


    match "posts/*" $ do
        route $ setExtension "html"
        compile $ do
            post <- pandocCompiler
            metadata <- getMetadata $ itemIdentifier post
            processPost post metadata
                >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            let archiveCtx =
                    field "posts" (\_ -> postList recentFirst) `mappend`
                    constField "title" "Archives"              `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            let indexCtx = field "posts" $ \_ -> postList (take 3 . recentFirst)

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" postCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext


--------------------------------------------------------------------------------
postList :: ([Item String] -> [Item String]) -> Compiler String
postList sortFilter = do
    posts   <- sortFilter <$> loadAll "posts/*"
    itemTpl <- loadBody "templates/post-item.html"
    list    <- applyTemplateList itemTpl postCtx posts
    return list
