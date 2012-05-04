{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Arrow (arr, (>>>))
import Control.Category (id)

import Hakyll

main :: IO ()
main = hakyll $ do

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

    -- Index
    match (list ["index.markdown"]) $ do 
        route $ setExtension "html"
        compile $ pageCompiler
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
