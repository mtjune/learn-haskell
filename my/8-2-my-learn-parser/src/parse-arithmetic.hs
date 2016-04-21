module Main where
import Control.Monad (forM_)
import Text.Trifecta
import Text.Trifecta.Delta(Delta(..))
import Text.PrettyPrint.ANSI.Leijen(putDoc)
-- import Text.Parser.Token (TokenParsing, natural, parens, reserve)
-- import Text.Parser.Token.Style (emptyOps)

data Expr = Literal Integer
          | Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
          | Div Expr Expr

arithmeticExpr :: Parser Expr
arithmeticExpr = do
  n  <- integer
  x2 <- optional $ do
    symbol "+"
    arithmeticExpr
  case x2 of
    Nothing -> return $ Literal n
    Just x -> return $ Sub (Literal n) x

-- table :: (Monad m, TokenParsing m) => [[Operator m Integer]]
-- table = [[binary "*" (*) AssocLeft, binary "/" (div) AssocLeft]
--         , [binary "+" (+) AssocLeft, binary "-" (-) AssocLeft]]


eval :: Expr -> Integer
eval (Literal n) = n
eval (Add x y) = eval x + eval y
eval (Sub x y) = eval x - eval y
eval (Mul x y) = eval x * eval y
eval (Div x y) = eval x `div` eval y

main = do
  con <- getContents
  forM_ (lines con) $ \str -> do
    case parseString arithmeticExpr (Columns 0 0) str of
      Failure doc -> do
        putDoc doc
        putStrLn "Parse error."
      Success expr  -> print $ eval expr
