{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Monoid ((<>))
import qualified Data.Text    as T
import qualified Data.Text.IO as T
import System.IO

word_process :: T.Text -> T.Text
-- word_process [] = []
-- word_process [x] = [x]
-- word_process word = [T.head word] ++ (drop 1 $ T.unpack $ T.reverse $ T.pack $ drop 1 word) ++ [last word]
word_process word
  | T.length word < 2 = word
  | otherwise = T.append (T.pack $ [T.head word]) $ T.append (T.reverse $ T.tail $ T.init word) (T.pack $ [T.last word])
  -- where
  --   append3 = (\x y z -> T.append x $ T.append y z)

main :: IO ()
main = do
  strings <- T.getLine

  T.putStrLn $ T.unwords $ map word_process $ T.words strings

  f <- isEOF
  if f then return() else main
