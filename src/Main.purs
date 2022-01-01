module Main where

import Options.Applicative
import Prelude (Unit, apply, bind, map, ($), (<>), (>>=))
import Data.List (List, toUnfoldable)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Effect.Console (log)
import Main.Shamir as Shamir
import Node.Buffer.Immutable as Buffer
import Node.Encoding as Encoding

dismantle :: DismantleOptions -> Effect Unit
dismantle (DismantleOptions { secret: s, shares: sh, threshold: t }) = do
  let buf = Buffer.fromString s Encoding.Hex
  shares <- Shamir.dismantle buf sh t
  let strShares = Buffer.toString Encoding.Hex `map` shares
  logShow strShares

assemble :: AssembleOptions -> Effect Unit
assemble (AssembleOptions { shares: shs }) = do
  secret <- Shamir.assemble $ toUnfoldable shs
  let str = Buffer.toString Encoding.Hex secret
  log str

data DismantleOptions = DismantleOptions
  { secret :: String
  , shares :: Int
  , threshold :: Int
  }

data AssembleOptions = AssembleOptions
  { shares :: List String
  }

data Dismantler = Dismantle (DismantleOptions) | Assemble (AssembleOptions)

dismantleOptionsParser :: Parser Dismantler
dismantleOptionsParser = ado
  secret <-
    argument str $
      metavar "Secret"
        <> help "Secret to dismantle"
        <> showDefault
  shares <-
    option int $ long "shares"
      <> metavar "Shares"
      <> short 'n'
      <> value 2
      <> help "Number of shares to create"
      <> showDefault
  threshold <-
    option int $ long "threshold"
      <> metavar "Threshold"
      <> short 't'
      <> value 2
      <> help "Number of shares required to assemble secret"
      <> showDefault
  in Dismantle (DismantleOptions { secret, shares, threshold })

assembleOptionsParser :: Parser Dismantler
assembleOptionsParser = ado
  shares <- many (argument str (metavar "SHARES..."))
  in Assemble (AssembleOptions { shares })

parser :: Parser Dismantler
parser =
  subparser
    $
      command "dismantle"
        ( info (dismantleOptionsParser <**> helper)
            $ progDesc "Dismantle secret to shares"
        ) <> command "assemble"
        ( info (assembleOptionsParser <**> helper)
            $ progDesc "Assemble shares to recreate secret"
        )

run :: Dismantler -> Effect Unit
run (Dismantle obj) = dismantle obj
run (Assemble obj) = assemble obj

opts :: ParserInfo Dismantler
opts =
  info (parser <**> helper)
    ( fullDesc
        <> header "Dismantler - Dismantle secrets to shares using Shamir's secret sharing"
    )

main :: Effect Unit
main = execParser opts >>= run
