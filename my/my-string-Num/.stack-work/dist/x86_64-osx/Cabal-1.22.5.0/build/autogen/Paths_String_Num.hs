module Paths_String_Num (
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

bindir     = "/Users/yukich/repository/learn-haskell/my/my-string-Num/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/bin"
libdir     = "/Users/yukich/repository/learn-haskell/my/my-string-Num/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/lib/x86_64-osx-ghc-7.10.3/String-Num-0.1.0.0-3V8tjLXibUoBraPLK5wd33"
datadir    = "/Users/yukich/repository/learn-haskell/my/my-string-Num/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/share/x86_64-osx-ghc-7.10.3/String-Num-0.1.0.0"
libexecdir = "/Users/yukich/repository/learn-haskell/my/my-string-Num/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/libexec"
sysconfdir = "/Users/yukich/repository/learn-haskell/my/my-string-Num/.stack-work/install/x86_64-osx/lts-5.0/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "String_Num_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "String_Num_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "String_Num_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "String_Num_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "String_Num_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
