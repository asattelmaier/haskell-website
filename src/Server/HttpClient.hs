module Server.HttpClient
( get
) where



------------------------------------------------------------------------------
import           Data.ByteString.Lazy    (ByteString)
import           Network.Connection      (TLSSettings (..))
import           Network.HTTP.Client     (ManagerSettings)
import qualified Network.HTTP.Client     as HTTP (newManager, responseBody)
import qualified Network.HTTP.Client.TLS as HTTP (mkManagerSettings)
import           Network.HTTP.Simple     (Request)
import qualified Network.HTTP.Simple     as HTTP (httpLBS, parseRequest_,
                                                  setRequestManager)



get :: String -> IO ByteString
get url = do
    request <- createRequest url
    response <- HTTP.httpLBS request
    return $ HTTP.responseBody response



createRequest :: String -> IO Request
createRequest url = do
  manager <- HTTP.newManager managerSettings
  return $ HTTP.setRequestManager manager $ HTTP.parseRequest_ url



managerSettings :: ManagerSettings
managerSettings = HTTP.mkManagerSettings tlsSettings Nothing



tlsSettings :: TLSSettings
tlsSettings = TLSSettingsSimple
  { settingDisableCertificateValidation = True
  , settingDisableSession = True
  , settingUseServerName = False
  }

