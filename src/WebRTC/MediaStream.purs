module WebRTC.MediaStream (
  MediaStream(..)
, MediaStreamConstraints(..)
, Blob(..)
, USER_MEDIA()
, getUserMedia
, mediaStreamToBlob
, createObjectURL
) where

import Prelude (Unit())
import Unsafe.Coerce (unsafeCoerce)
import Control.Monad.Aff (Aff(), makeAff)
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Exception (Error())

foreign import data MediaStream :: *

foreign import _getUserMedia
  :: forall e. (MediaStream -> Eff e Unit) ->
               (Error -> Eff e Unit) ->
               MediaStreamConstraints ->
               Eff e Unit

foreign import data USER_MEDIA :: !

getUserMedia :: forall e. MediaStreamConstraints -> Aff (userMedia :: USER_MEDIA | e) MediaStream
getUserMedia c = makeAff (\e s -> _getUserMedia s e c)

newtype MediaStreamConstraints =
  MediaStreamConstraints { video :: Boolean
                         , audio :: Boolean
                         }

foreign import data Blob :: *

mediaStreamToBlob :: MediaStream -> Blob
mediaStreamToBlob = unsafeCoerce

foreign import createObjectURL
  :: forall e. Blob -> Eff e String
