module Main where



------------------------------------------------------------------------------
import qualified System.Environment as System (getArgs)



------------------------------------------------------------------------------
import qualified Server.Main        as Server (Config (Config), create)



main :: IO ()
main = System.getArgs >>= parse



parse :: [String] -> IO ()
parse [host, port] = Server.create $ Server.Config (Just host) (Just port)
parse [host]       = Server.create $ Server.Config (Just host) Nothing
parse _            = Server.create $ Server.Config Nothing Nothing
