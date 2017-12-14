require "middleman-core"
require "piwik-middleman/extension"

Middleman::Extensions.register(:piwikmiddleman, PiwikExtension)
