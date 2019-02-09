# Require core library
require 'middleman-core'

# Extension namespace
class MatomoExtension < ::Middleman::Extension
  option :domain, 'localhost.com', 'An example url for motomo'
  option :url, 'matomo', 'An example path to your matomo installation'
  option :id, 1, 'The id for matomo'

  def after_configuration
    app.config[:matomo_domain] = options.domain
    app.config[:matomo_url] = options.url
    app.config[:matomo_id] = options.id
  end

  helpers do
    def matomo
      <<END
<script>
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{config[:matomo_domain]}/#{config[:matomo_url]}/";
  _paq.push(['setTrackerUrl', u+'piwik.php']);
  _paq.push(['setSiteId', 1]);
  var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
  g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
    <noscript><p><img src="https://#{config[:matomo_domain]}/#{config[:matomo_url]}/piwik.php?idsite=#{config[:matomo_id]}" style="border:0;" alt="" /></p></noscript>
END
    end
  end
end
