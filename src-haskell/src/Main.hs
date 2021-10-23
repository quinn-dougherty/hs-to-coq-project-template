module Main where

import Communication

import Data.Word
import qualified Data.ByteString as B

testchankey' :: [Word8]
testchankey' = map toEnum ([1,1,1,1,1] ++ replicate 27 0) :: [Word8]
testchankey :: Key -- don't use this key irl
testchankey = Key $ B.pack testchankey'


main :: IO ()
main = do
  let scs = initializeSecureChannel testchankey Alice
  print scs
  print $ fmap (msgCntSendIncr (2 ^ 8 - 1)) scs
