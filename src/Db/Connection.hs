module Db.Connection ( createConnection, getConnection ) where

import           Database.PostgreSQL.Simple
import           Data.Pool ( createPool, withResource, Pool )

createConnection' :: IO Connection
createConnection' = do
    let host = "db"
    let port = 5432
    let pass = "default_password"

    connect ConnectInfo
        { connectHost = host
        , connectPort = port
        , connectUser = "mister"
        , connectPassword = pass
        , connectDatabase = "fortunedb"
        }

type DbConnection = Pool Connection

createConnection :: IO DbConnection
createConnection = createPool createConnection' close 2 500 100

getConnection :: DbConnection -> IO Connection
getConnection pool = withResource pool pure