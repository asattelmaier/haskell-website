module Server.Main
( create
) where



------------------------------------------------------------------------------
import           Data.ByteString                  (ByteString)
import           Snap.Core                        (Snap)
import qualified Snap.Http.Server                 as Snap (Config,
                                                           defaultConfig,
                                                           httpServe)
import qualified Snap.Internal.Http.Server.Config as Snap (bind, port)
import           System.Directory                 (setCurrentDirectory)
import qualified Text.Read                        as Text (readMaybe)



------------------------------------------------------------------------------
import           Server.Config                    (Config)
import qualified Server.Config                    as Config (host, port,
                                                             workingDir)
import qualified Server.Controller                as Controller (create)



create :: Config -> IO ()
create config = setCurrentDirectory (Config.workingDir config)
  >> Snap.httpServe (createSnapConfig config) (Controller.create config)



createSnapConfig :: Config -> Snap.Config Snap a
createSnapConfig config = Snap.defaultConfig
  { Snap.port = parsePort config
  , Snap.bind = parseHost config
  }



parsePort :: Config -> Maybe Int
parsePort = Text.readMaybe . Config.port



parseHost :: Config -> Maybe ByteString
parseHost = Text.readMaybe . Config.host

