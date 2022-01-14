module Main.Shamir where

import Node.Buffer.Immutable
import Data.Function.Uncurried (Fn2)
import Effect (Effect)
import JSFFI (foreignEval)

dismantle :: forall a. Fn2 ImmutableBuffer a (Effect (Array ImmutableBuffer))
dismantle = foreignEval "(...args) => () => require('shamirs-secret-sharing').split(...args)"

assemble :: Array String -> Effect ImmutableBuffer
assemble = foreignEval "(shares) => () => require('shamirs-secret-sharing').combine(shares)"
