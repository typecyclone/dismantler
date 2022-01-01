module Main.Shamir where

import Effect (Effect)
import Node.Buffer.Immutable

foreign import dismantle :: ImmutableBuffer -> Int -> Int -> Effect (Array ImmutableBuffer)

foreign import assemble :: Array String -> Effect ImmutableBuffer
