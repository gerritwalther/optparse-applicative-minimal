module Main where

import Options.Applicative
import Control.Monad.Trans.Reader

data Configuration = Configuration
                    { foo :: String
                    , bar :: Int
                    }

configuration :: Parser Configuration
configuration = Configuration
    <$> strOption
        ( long "foo"
       <> metavar "ARG1"
        )
    <*> option auto
        ( long "bar"
       <> metavar "ARG2"
       )

main :: IO ()
main = do
    config <- execParser (info configuration fullDesc)
    putStrLn (show (bar config) ++ foo config)