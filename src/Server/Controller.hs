{-# LANGUAGE OverloadedStrings #-}



module Server.Controller
( create
) where



------------------------------------------------------------------------------
import           Data.ByteString (ByteString)
import           Snap.Core       (Snap)
import qualified Snap.Core       as Snap (getRequest, rqPathInfo)



------------------------------------------------------------------------------
import           Server.Service  as Service (redirectToIndex, serveIndex)



create :: Snap ()
create = routes . Snap.rqPathInfo =<< Snap.getRequest



routes :: ByteString -> Snap ()
routes "" = Service.serveIndex
routes _  = Service.redirectToIndex

