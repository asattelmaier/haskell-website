module Server.Controller
( create
) where



import           Snap.Core (Snap)
import qualified Snap.Core as Snap (route)



create :: Snap ()
create = Snap.route []
