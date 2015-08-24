module WebRTC.WebSocket (
  WebSocket(..)
, MessageEvent(..)
, newWebSocket
, send
, onmessage
) where

import Prelude (Unit())
import Control.Monad.Eff (Eff())

foreign import data WebSocket :: *

foreign import newWebSocket
  :: forall e. String -> Eff e WebSocket

-- TODO: Make a safe JS value library!
foreign import send
  :: forall e. String -> WebSocket -> Eff e Unit

type MessageEvent = { "data" :: String }

foreign import onmessage
  :: forall e. (MessageEvent -> Eff e Unit) -> WebSocket -> Eff e Unit
