require "middleman-core"
require "matomo-middleman/extension"

Middleman::Extensions.register(:matomomiddleman, MatomoExtension)
