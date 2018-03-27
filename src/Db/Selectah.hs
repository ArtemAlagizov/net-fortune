{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Db.Selectah ( selectRandomFortune, Fortune ) where

import           Database.PostgreSQL.Simple
import           Data.Pool ( createPool, withResource, Pool )
import           GHC.Generics ( Generic(..) )

data Fortune = Fortune
    { id :: Int
    , fortuneText :: String
    } deriving (Generic, Show)

instance FromRow Fortune
instance ToRow Fortune

selectAllFortunes :: Connection -> IO [Fortune]
selectAllFortunes conn = query_ conn "select fortune_id, fortune_text from fortune"

selectRandomFortune :: Connection -> IO [Fortune]
selectRandomFortune conn = query_ conn "select fortune_id, fortune_text from fortune order by random() limit 1"