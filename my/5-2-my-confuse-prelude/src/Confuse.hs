module Confuse
    ( (+)
    , (*)
    ) where

import qualified Prelude as P

(+) :: P.Num a => a -> a -> a
(+) = (P.*)

(*) :: P.Num a => a -> a -> a
(*) = (P.+)

infix 6 *
infix 7 +
