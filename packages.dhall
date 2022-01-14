let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.5-20211116/packages.dhall sha256:7ba810597a275e43c83411d2ab0d4b3c54d0b551436f4b1632e9ff3eb62e327a

in  upstream
with js-eval = { dependencies = [
  "console",
  "effect",
  "prelude",
  "psci-support"
], repo = "https://github.com/rajatsharma/purescript-js-eval.git", version = "e2b72899bc13974770631ac59fbbf111e6ecd7e9" }
with js-eval = { dependencies = [
  "console",
  "effect",
  "prelude",
  "psci-support"
], repo = "https://github.com/rajatsharma/purescript-js-eval.git", version = "7489643db9df16423d6d9ac351c6ef962a7b7065" }
