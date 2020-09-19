module DConf.Data where

import           Data.Map                       ( Map )
import           Data.Text                      ( Text )

newtype InputFilePath = InputFilePath FilePath deriving Show
newtype OutputFilePath = OutputFilePath FilePath deriving Show
newtype ProcessTimeout = ProcessTimeout Int deriving Show

data Verbosity = Normal | Verbose

newtype Nix = Nix { unNix :: Text } deriving Show

newtype Root = Root Text deriving (Eq, Show)

newtype Key = Key Text deriving (Eq, Ord, Show)

data Value = S Text
           | B Bool
           | I Int
           | I32 Int
           | I64 Int
           | D Double
           | T Value Value
           | TL Value Value -- a tuple within a list
           | L [Value]
           deriving (Eq, Show)

type Header = Text
type Content = Map Key Value

data Entry = Entry
  { entryHeader :: Header
  , entryContent :: Content
  } deriving (Eq, Show)
