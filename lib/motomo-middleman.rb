require "middleman-core"
require "motomo-middleman/extension"

Middleman::Extensions.register(:motomomiddleman, MotomoExtension)
