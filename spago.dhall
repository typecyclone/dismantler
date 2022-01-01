{ name = "dismantler"
, dependencies =
  [ "console"
  , "effect"
  , "lists"
  , "node-buffer"
  , "optparse"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
