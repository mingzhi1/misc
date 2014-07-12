import Data.Char
import Data.List.Split
import System.Environment

solve :: String -> String
solve board = do 
          

main :: IO()
main = do
          args <- getArgs
          content <- readFile (head args)
          print content
          let board = splitOn "\n" content
          print board
