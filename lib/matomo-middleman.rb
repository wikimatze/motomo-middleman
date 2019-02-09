require "middleman-core"

Middleman::Extensions.register :matomomiddleman do
  require "matomo-middleman/extension"
  MatomoExtension
end
