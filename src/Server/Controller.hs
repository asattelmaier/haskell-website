{-# LANGUAGE OverloadedStrings #-}



module Server.Controller
( create
) where



------------------------------------------------------------------------------
import           Control.Applicative ((<|>))
import           Snap.Core           (Snap)
import qualified Snap.Core           as Snap (ifTop, modifyResponse,
                                              setResponseStatus)
import qualified Snap.Util.FileServe as Snap (serveDirectory, serveFile)



create :: Snap ()
create =
  Snap.ifTop (Snap.serveFile "Static/index.html")
  <|> Snap.serveDirectory "Static"
  <|> serveNotFound



serveNotFound :: Snap ()
serveNotFound =
  Snap.serveFile "Static/404.html" >>
  Snap.modifyResponse (Snap.setResponseStatus 404 "Not Found")

