module Mal.Step0 where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Node.Readline (Interface, prompt, close, setLineHandler, setPrompt, noCompletion, createConsoleInterface)

main :: Effect Unit
main = do
  interface <- createConsoleInterface noCompletion
  setPrompt "user> " interface
  loop interface

loop :: Interface -> Effect Unit
loop interface =
  do
    prompt interface
    interface
    # setLineHandler \s -> case s of
        ":q" -> \_ -> close interface
        ":Q" -> \_ -> close interface
        line -> do
          log line
          loop

read :: String -> String
read s = s

eval :: String -> String
eval s = s

print :: String -> String
print s = s

rep :: String -> String
rep = read >>> eval >>> print
