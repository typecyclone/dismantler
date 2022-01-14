{ name = "dismantler"
, dependencies =
  [ "console"
  , "effect"
  , "functions"
  , "js-eval"
  , "lists"
  , "node-buffer"
  , "optparse"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
