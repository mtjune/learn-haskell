module Paths_confuse_prelude (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/yukich/repository/my-learn-haskell/my/5-2-my-confuse-prelude/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/bin"
libdir     = "/Users/yukich/repository/my-learn-haskell/my/5-2-my-confuse-prelude/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/lib/x86_64-osx-ghc-7.10.3/confuse-prelude-0.1.0.0-9MxP2yEelhq07VyJZHLA48"
datadir    = "/Users/yukich/repository/my-learn-haskell/my/5-2-my-confuse-prelude/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/share/x86_64-osx-ghc-7.10.3/confuse-prelude-0.1.0.0"
libexecdir = "/Users/yukich/repository/my-learn-haskell/my/5-2-my-confuse-prelude/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/libexec"
sysconfdir = "/Users/yukich/repository/my-learn-haskell/my/5-2-my-confuse-prelude/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "confuse_prelude_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "confuse_prelude_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "confuse_prelude_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "confuse_prelude_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "confuse_prelude_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
