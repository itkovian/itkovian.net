-- itkovian.net authors mapping and functionality
--
--------------------------------------------------------------------------------
module Author
    ( authorTranslation
    ) where

import           Data.Char (isSpace)
import           Data.List (intercalate)
import           Data.List.Split (splitOn)
import qualified Data.Map as M

import Debug.Trace (trace)

authors = M.fromList $ [
      ("Andy Georges", "http://itkovian.net")
    , ("Kenneth Hoste", "http://boegel.kejo.be")
    , ("Koen De Bosschere", "http://www.elis.ugent.be/~kdb")
    , ("Lieven Eeckhout", "http://www.elis.ugent.be/~leeckhou")
    , ("Dries Buytaert", "http://buytaert.net")
    ]


--------------------------------------------------------------------------------
-- | Strip whitespace from both ends of a string
strip :: String -> String
strip = reverse . ds . reverse . ds
  where ds = dropWhile isSpace


--------------------------------------------------------------------------------
-- | Changes an author name into a hyperlink to the author's homepage
authorTranslation :: String  -- ^ comma separated string containing author names
                  -> String  -- ^ similar string where knows authors are replaced by hyperlinks
authorTranslation authorString =
    let as = map strip $ splitOn "," authorString
    in trace ("split authors -> [" ++ show as ++ "]") $ intercalate ", " $ map translate as
  where translate a = case M.lookup a authors of
                        Just url -> "<a href=\"" ++ url ++ "\">" ++ a ++ "</a>"
                        Nothing  -> a
