module Server.Main
( Config (Config)
, create
) where



------------------------------------------------------------------------------
import qualified Snap.Http.Server  as Snap (httpServe)
import           System.Directory  (setCurrentDirectory)



------------------------------------------------------------------------------
import           Server.Config     (Config (Config))
import qualified Server.Config     as Config (create)
import qualified Server.Controller as Controller (create)



create :: Config -> IO ()
create config =
  setCurrentDirectory "src" >>
  Snap.httpServe (Config.create config) Controller.create

