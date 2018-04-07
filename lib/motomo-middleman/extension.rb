# Require core library
require 'middleman-core'

# Extension namespace
class MotomoExtension < ::Middleman::Extension
  option :domain, 'localhost.com', 'An example url for motomo'
  option :url, 'piwik', 'An example path to your motomo installation'
  option :id, 1, 'The id for piwik'

  def after_configuration
    app.config[:motomo_domain] = options.domain
    app.config[:motomo_url] = options.url
    app.config[:motomo_id] = options.id
  end

  helpers do
    def motomo
      <<END
      <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
          var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{config[:motomo_domain]}/#{config[:motomo_url]}/";
        _paq.push(['setTrackerUrl', u+'piwik.php']);
        _paq.push(['setSiteId', 1]);
        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
        g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
      </script>
      <noscript><p><img src="https://#{config[:motomo_domain]}/#{config[:motomo_url]}/piwik.php?idsite=#{config[:motomo_id]}" style="border:0;" alt="" /></p></noscript>
END
    end
  end
end
