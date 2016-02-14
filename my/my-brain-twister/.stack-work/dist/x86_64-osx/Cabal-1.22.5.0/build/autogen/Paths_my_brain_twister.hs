module Paths_my_brain_twister (
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

bindir     = "/Users/yukich/repository/learn-haskell/my/my-brain-twister/.stack-work/install/x86_64-osx/lts-5.1/7.10.3/bin"
libdir     = "/Users/yukich/repository/learn-haskell/my/my-brain-twister/.stack-work/install/x86_64-osx/lts-5.1/7.10.3/lib/x86_64-osx-ghc-7.10.3/my-brain-twister-0.1.0.0-8o2GZt526EC8psfSKyN7tJ"
datadir    = "/Users/yukich/repository/learn-haskell/my/my-brain-twister/.stack-work/install/x86_64-osx/lts-5.1/7.10.3/share/x86_64-osx-ghc-7.10.3/my-brain-twister-0.1.0.0"
libexecdir = "/Users/yukich/repository/learn-haskell/my/my-brain-twister/.stack-work/install/x86_64-osx/lts-5.1/7.10.3/libexec"
sysconfdir = "/Users/yukich/repository/learn-haskell/my/my-brain-twister/.stack-work/install/x86_64-osx/lts-5.1/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_brain_twister_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_brain_twister_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "my_brain_twister_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_brain_twister_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_brain_twister_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
