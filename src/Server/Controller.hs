{-# LANGUAGE OverloadedStrings #-}



module Server.Controller
( create
) where



------------------------------------------------------------------------------
import           Control.Applicative ((<|>))
import           Control.Monad       (ap)
import           Snap.Core           (Snap)
import qualified Snap.Core           as Snap (ifTop, modifyResponse,
                                              setResponseStatus)
import qualified Snap.Util.FileServe as Snap (serveDirectory, serveFile)



------------------------------------------------------------------------------
import           Server.Config       (Config)
import qualified Server.Config       as Config (indexFile, notFoundFile,
                                                staticDir)



create :: Config -> Snap ()
create config =
  Snap.ifTop (serveIndexFile config)
  <|> Snap.serveDirectory (Config.staticDir config)
  <|> serveNotFound config



serveIndexFile :: Config -> Snap ()
serveIndexFile = ap serveFile Config.indexFile



serveNotFound :: Config -> Snap ()
serveNotFound config =
  serveNotFoundFile config
  *> Snap.modifyResponse (Snap.setResponseStatus 404 "Not Found")



serveNotFoundFile :: Config -> Snap ()
serveNotFoundFile = ap serveFile Config.notFoundFile



serveFile :: Config -> FilePath -> Snap ()
serveFile = (Snap.serveFile .) . combinePaths . Config.staticDir



combinePaths :: FilePath -> FilePath -> FilePath
combinePaths dir file = dir ++ "/" ++ file

