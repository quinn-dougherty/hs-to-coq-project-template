-- |

module Communication
  ( initializeSecureChannel
  , Role (..)
  , Key (..)
  , msgCntSendIncr
  ) where

import Types
import qualified Data.ByteString as B
import Control.Monad (liftM2)

(.++) :: B.ByteString -> B.ByteString -> B.ByteString
(.++) = B.append
infixr 5 .++


-- msgCntSendIncr maxCount :: Lens' SecureChannelState Counter
msgCntSendIncr :: Integer -> SecureChannelState -> Maybe SecureChannelState
msgCntSendIncr maxCount = lens msgCntSend (\scs counter -> scs { msgCntSend = counter }) (incrValid maxCount)
-- msgCntRecvCopy maxCount sendCounter :: Lens' SecureChannelState Counter
msgCntRecvCopy :: Integer -> Counter -> SecureChannelState -> Maybe SecureChannelState
msgCntRecvCopy maxCount sendCounter =
  lens msgCntRecv (\scs counter -> scs { msgCntRecv = counter }) (copyValid maxCount sendCounter)

-- The difference between Alice and Bob cases is subtle! It amounts to a nameswap of a hash.
initializeSecureChannel' :: Key -> Role -> SecureChannelState
initializeSecureChannel' k Bob = SecureChannelState
    {
      keySendEncr = k,
      keyRecvEncr = k,
      keySendAuth = k,
      keyRecvAuth = k,
      msgCntSend = Counter 0,
      msgCntRecv = Counter 0
    }
initializeSecureChannel' k Alice = SecureChannelState
    {
      keySendEncr = k,
      keyRecvEncr = k,
      keySendAuth = k,
      keyRecvAuth = k,
      msgCntSend = Counter 0,
      msgCntRecv = Counter 0
    }

-- Must be lifted to Maybe because of validKey
initializeSecureChannel :: Key -> Role -> Maybe SecureChannelState
initializeSecureChannel k role = liftM2 initializeSecureChannel' (validKey256 k) (Just role)
