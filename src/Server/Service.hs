{-# LANGUAGE OverloadedStrings #-}



module Server.Service
( serveIndex
, redirectToIndex
) where



------------------------------------------------------------------------------
import           Snap.Core           (Snap)
import qualified Snap.Core           as Snap (redirect)
import qualified Snap.Util.FileServe as Snap (serveFileAs)



serveIndex :: Snap ()
serveIndex = Snap.serveFileAs "text/plain" "README.md"



redirectToIndex :: Snap ()
redirectToIndex = Snap.redirect "/"

