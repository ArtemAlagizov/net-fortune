{-# LANGUAGE OverloadedStrings #-}

import           Server
import           Snap
import           TestUtils
import           Test.Hspec
import qualified Test.Hspec.Snap as T

-- | Tests
tests :: Spec
tests = do
    T.snap (route routes) appInit $ do
        describe "Application" $ do
            it "Has no /non-existing route" $ do
                T.get "/non-existing" >>= T.should404

main :: IO()
main = do
    hspec tests