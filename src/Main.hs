module Main where



------------------------------------------------------------------------------
import qualified System.Environment as System (getArgs)



------------------------------------------------------------------------------
import qualified Server.Config      (create)
import qualified Server.Main        as Server (create)



main :: IO ()
main = System.getArgs >>= Server.create . Server.Config.create

