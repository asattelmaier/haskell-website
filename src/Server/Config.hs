module Server.Config
( Config (Config)
, create
) where



------------------------------------------------------------------------------
import           Control.Monad                    ((<=<))
import           Data.ByteString                  (ByteString)
import qualified Data.ByteString.Char8            as B (pack)
import           Snap.Core                        (Snap)
import qualified Snap.Http.Server                 as Snap (Config,
                                                           defaultConfig)
import qualified Snap.Internal.Http.Server.Config as Snap (bind, port)
import           Text.Read                        (readMaybe)



data Config = Config { host :: Maybe String
                     , port :: Maybe String
                     }



create :: Config -> Snap.Config Snap a
create config = Snap.defaultConfig { Snap.port = getPort config
                                   , Snap.bind = getHost config
                                   }



getHost :: Config -> Maybe ByteString
getHost = fmap B.pack . host



getPort :: Config -> Maybe Int
getPort = readMaybe <=< port

