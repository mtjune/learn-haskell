module Main where

{-
　このプログラムを普通に実行すると、　　715 と表示されます。
　演算子 + と * の意味と優先順位を入れ替えて、このプログラムが 570 と表示するようにしてください。

  なお、他のモジュールファイルはいくらでも作ってかまいませんが、このファイルは
  import文以外の部分を編集してはいけません。
　import文はいくら追加・削除しても大丈夫です。
-}

import Lib
import Prelude hiding ((+), (*))
import Confuse

main :: IO ()
main = do
  print $ 5 + 100 * 7 + 10
