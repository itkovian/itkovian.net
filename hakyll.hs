{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Arrow (arr, (>>>))
import Control.Category (id)
import Data.Monoid (mempty)
import Prelude hiding (id)

import Hakyll

main :: IO ()
main = hakyllWith config $ do

    -- Images
    match "images/*" $ do
        route idRoute
        compile copyFileCompiler

    -- Files (PDF, ...)
    match "files/**" $ do
        route idRoute
        compile copyFileCompiler

    -- tmp should not be visible to all, just people who know the URL of the files we drop there.
    match "tmp/index.html" $ do
        route idRoute
        compile $ pageCompiler
            >>> relativizeUrlsCompiler

    -- CSS
    match "css/*" $ do
        route idRoute
        compile compressCssCompiler

    -- Posts list (taken from the simpleblog example)
    match "posts.html" $ route idRoute
    create "posts.html" $ constA mempty
        >>> arr (setField "title" "All posts")
        >>> arr (setField "date" "Today")
        >>> setFieldPageList recentFirst "templates/postitem.html" "posts" "posts/*"
        >>> applyTemplateCompiler "templates/posts.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Index
    match "index.html" $ route idRoute
    create "index.html" $ constA mempty
        >>> arr (setField "title" "I am not yet done.")
        >>> arr (setField "date" "Today")
        >>> setFieldPageList (take 10 . recentFirst) "templates/postitem.html" "posts" "posts/*"
        >>> applyTemplateCompiler "templates/index.html"
        >>> applyTemplateCompiler "templates/default.html"
        >>> relativizeUrlsCompiler

    -- Posts
    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pageCompiler
            >>> arr (renderDateField "date" "%B %e, %Y" "Date unknown")
            >>> applyTemplateCompiler "templates/post.html"
            >>> relativizeUrlsCompiler

    -- Read templates
    match "templates/*" $ compile templateCompiler


config :: HakyllConfiguration
config = defaultHakyllConfiguration
    { deployCommand = "rsync --checksum -ave 'ssh' \
                      \_site/* itkovian@itkovian.net:itkovian.net"
    }

