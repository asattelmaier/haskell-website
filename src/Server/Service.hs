{-# LANGUAGE OverloadedStrings #-}



module Server.Service
( serveIndex
, redirectToIndex
) where



------------------------------------------------------------------------------
import qualified Control.Monad.IO.Class as IO (liftIO)
import           Data.ByteString.Lazy   (ByteString)
import           Snap.Core              (Snap)
import qualified Snap.Core              as Snap (redirect, writeLBS)
import           System.Environment



------------------------------------------------------------------------------
import qualified Server.HttpClient      as HttpClient (get)



serveIndex :: Snap ()
serveIndex = Snap.writeLBS =<< IO.liftIO requestIndex



redirectToIndex :: Snap ()
redirectToIndex = Snap.redirect "/"



requestIndex :: IO ByteString
requestIndex = HttpClient.get =<< getEnv "INDEX_RESOURCE_LOCATION"

