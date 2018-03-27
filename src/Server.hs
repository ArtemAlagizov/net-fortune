{-# LANGUAGE OverloadedStrings #-}

module Server ( serve, appInit, routes ) where

import           Control.Monad.IO.Class
import           Data.ByteString
import           Data.Text
import           Snap
import           Db.Connection ( createConnection, getConnection )
import           Db.Selectah ( selectRandomFortune, Fortune )

-- | Application database pool, state, etc. can be added here
data App = App
  {
  }

-- | Application routes
routes :: [(ByteString, Handler App App ())]
routes = [("/fortune", method GET $ predictFortune)]

-- | Get random fortune, establishes connection to db every time it is called
-- | TODO: improve that, obviously
getRandomFortune :: IO [Fortune]
getRandomFortune = do
    dbConn <- createConnection
    conn <- liftIO $ getConnection dbConn
    fortune <- liftIO $ (selectRandomFortune conn)
    return fortune

-- | Fortune route handler
predictFortune :: Handler App App ()
predictFortune = do
    f <- liftIO $ getRandomFortune
    writeText . Data.Text.pack $ (show f) -- writeText expects Text, f is a String, pack converts String to Text

-- | Initialization
appInit :: SnapletInit App App
appInit = makeSnaplet "microservice" "Fortune microservice" Nothing $ do
    addRoutes routes
    return $ App

serve :: IO ()
serve = do
    -- Serve the app
    serveSnaplet (setPort 8080 defaultConfig) appInit
