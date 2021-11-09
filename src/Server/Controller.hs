{-# LANGUAGE OverloadedStrings #-}



module Server.Controller
( create
) where



------------------------------------------------------------------------------
import           Data.ByteString          (ByteString)
import           Snap.Core                (Snap)
import qualified Snap.Core                as Snap (getRequest, modifyResponse,
                                                   rqPathInfo)
import           Snap.Internal.Http.Types (Response)
import qualified Snap.Internal.Http.Types as Snap (setHeader)



------------------------------------------------------------------------------
import           Server.Service           as Service (redirectToIndex,
                                                      serveIndex)



create :: Snap ()
create = createRoutes >> setResponseHeader



createRoutes :: Snap ()
createRoutes = routes . Snap.rqPathInfo =<< Snap.getRequest



routes :: ByteString -> Snap ()
routes "" = Service.serveIndex
routes _  = Service.redirectToIndex



setResponseHeader :: Snap ()
setResponseHeader = Snap.modifyResponse setContentType



setContentType :: Response -> Response
setContentType = Snap.setHeader "Content-Type" "application/json"

