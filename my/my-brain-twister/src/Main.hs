module Main where

import System.IO
import GHC.Base
-- import Data.Char

-- word_process :: String -> String
-- word_process word = [head word] ++ (drop 1 $ reverse $ drop 1 word) ++ [last word]
-- sentence_process :: [Char] -> [Char]
-- sentence_process = unwords $ map id $ words


word_process [x] = [x]
word_process word = [head word] ++ (drop 1 $ reverse $ drop 1 word) ++ [last word]

main :: IO ()
main = do
  strings <- getLine
  -- putStrLn $ unwords $ map (\word -> [head word] ++ (drop 1 $ reverse $ drop 1 word) ++ [last word]) $ words strings

  putStrLn $ unwords $ map word_process $ words strings
    -- where
    --   word_process [x] = "x"
    --   word_process word = [head word] ++ (drop 1 $ reverse $ drop 1 word) ++ [last word]

  f <- isEOF
  if f then return() else main
