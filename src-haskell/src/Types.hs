-- |

module Types
  ( Key (..)
  , Mac (..)
  , Role (..)
  , HashedValue (..)
  , IV (..)
  , Counter (..)
  , SecureChannelState (..)
  , Transmission (..)
  , Message (..)
  , Datum (..)
  , validKey256
  , keyFromHashedValue
  , macFromHashedValue
  , incrValid
  , copyValid
  , lens
  ) where

import qualified Data.ByteString as B
import Data.Word

-- Our definition of security requires key to be 256 bits long
validKey256 :: Key -> Maybe Key
validKey256 key
  | B.length (unKey key) >= 256 `div` 8 - 1 = Just key
  | otherwise = Nothing

newtype Key = Key { unKey :: B.ByteString } deriving (Eq, Show)

newtype Mac = Mac { unMac :: B.ByteString } deriving (Eq, Show)

data Role = Alice | Bob deriving (Eq, Show)

newtype HashedValue = HashedValue { unHashedValue :: B.ByteString } deriving (Eq, Show)
keyFromHashedValue :: HashedValue -> Key
keyFromHashedValue = Key . unHashedValue
macFromHashedValue :: HashedValue -> Mac
macFromHashedValue = Mac . unHashedValue

newtype IV = IV { unIV :: B.ByteString } deriving (Eq, Show)
newtype Counter = Counter { unCounter :: Word8 } deriving (Eq, Show, Ord)
data SecureChannelState = SecureChannelState
  {
    keySendEncr :: Key,
    keyRecvEncr :: Key,
    keySendAuth :: Key,
    keyRecvAuth :: Key,
    msgCntSend :: Counter,
    msgCntRecv :: Counter
  } deriving Show

newtype Transmission = Transmission { unTransmission :: B.ByteString } deriving (Eq, Show)

newtype Message = Message { unMessage :: String } deriving (Eq, Show)
newtype Datum = Datum { unDatum :: String } deriving (Eq, Show)

incrValid :: Integer ->  Counter -> Maybe Counter
incrValid maxCount counter
  | toInteger (unCounter counter) < maxCount = Just $ Counter (1 + unCounter counter)
  | otherwise = Nothing
copyValid :: Integer -> Counter -> Counter -> Maybe Counter
copyValid maxCount counter _
  | toInteger (unCounter counter) < maxCount = Just counter
  | otherwise = Nothing


lens :: Functor f => (s -> a) -> (s -> a -> s) -> (a -> f a) -> s -> f s
lens sa sas afa s = sas s <$> afa (sa s)
