module Mal.Readline where

import Prelude
import Effect (Effect)
import Node.Readline (createConsoleInterface, noCompletion, setPrompt, prompt)

read :: String -> String
read s = s

eval :: String -> String
eval s = s

print :: String -> String
print s = s

rep :: String -> String
rep = read >>> eval >>> print

main :: Effect Unit
main = do
  interface <- createConsoleInterface noCompletion
  setPrompt "user> " interface
  prompt interface
