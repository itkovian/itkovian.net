{-# LANGUAGE OverloadedStrings #-}
module Main where

import Prelude hiding (id)
import Control.Arrow ((>>>))
import Control.Category (id)

import Hakyll

main :: IO ()
main = hakyll $ do
    -- Index
    match (list ["index.markdown"]) $ do 
        route $ setExtension "html"
        compile $ pageCompiler
            >>> applyTemplateCompiler "templates/default.html"
            >>> relativizeUrlsCompiler

    -- Read templates
    match "templates/*" $ compile templateCompiler
