-----
Title:  Aligning data from separate files using Haskell
Author: Andy Georges
Date: May 31, 2008
----







If you need to align the data from multiple files fast, Haskell is the
way to go. For example, given a number of files, with an equal number of
lines, each containing a number. How can we easily create a single file
where each line contains items from each of the original files,
separated by a separator of your choice?


One way to do it is like this.


1.  2.  module Main() where
3.  4.  import Control.Monad(mapM)
5.  import Data.List(transpose, intersperse)
6.  import System.Environment(getArgs)
7.  import System.IO
8.  9.  main = do
10. header:lookups:files <- getArgs
11. handles <- mapM (
12. contents <- mapM hGetContents handles
13. let output = map (concat . (
transpose $ map lines contents
14. putStrLn header
15. mapM


First of all, I think it is good practice to only import the things you
need. Hence the e.g., import Control.Monad(mapM). Yet, I can't seem to
import IOMode from System.IO so there I imported the lot.


Second, it is paramount that each line inside a do statement has the
same type, namely IO () in this case. This means we use a mapM
last statement (mapM
where m becomes IO).


Essentially, we handle all files simultaneously, by mapping functions
manipulating them into the IO monad using mapM (the type is mapM ::
(Monad m) =
IO as we're executing actions in main :: IO ()). For example, we read
the contents of each file in a lazy manner using hGetContents, which
results in something that has the type IO [String]. Since we assigned
this to the contents *name*, using <-, contents :: [String]. So, we have
a list of Strings, representing the content of each file. Using pure
functions, we get the data in the shape we like: we split the contents
of each file with lines, and transpose the result. Then we can inject
the separator using intersperse and we concatenate the result. Finally,
we need to show the result. We put everything to stdout, using putStrLn
:: String -
it out first. Then we print each line of the new file.


Admittedly, I used to have a hard time grokking this, but since I looked
at the [Write yourself a Scheme in 48
hours](http://halogen.note.amherst.edu/~jdtang/scheme_in_48/tutorial/parser.html)
things have picked up.




