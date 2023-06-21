module Server.Config
( Config (..)
, create
) where



data Config = Config { host         :: !String
                     , port         :: !String
                     , workingDir   :: !FilePath
                     , staticDir    :: !FilePath
                     , indexFile    :: !FilePath
                     , notFoundFile :: !FilePath
                     }



defaultConfig :: Config
defaultConfig = Config
  { host = "localhost"
  , port = "8000"
  , workingDir = "src"
  , staticDir = "Static"
  , indexFile = "index.html"
  , notFoundFile = "404.html"
  }



create :: [String] -> Config
create [h, p] = defaultConfig { host = h, port = p }
create [h]    = defaultConfig { host = h }
create _      = defaultConfig

