module SkarbnikCore where

import Options.Applicative
import Data.Semigroup ((<>))

data Config = Config
  { incomeCsvPath :: String
  , costsCsvPath :: String
  } deriving Show

configParser :: Parser Config
configParser = Config
  <$> strOption (long "incomeCSV" <> help "File holding all incomes in CSV format")
  <*> strOption (long "costsCSV" <> help "File with costs, required CSV format")

skarbnik :: IO ()
skarbnik = do
  config <- execParser parserInfo
  putStrLn $ "Running Skarbnik with configuration " ++ (show config)

  where
    parserInfo = info (configParser <**> helper) fullDesc
