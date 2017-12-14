# Require core library
require 'middleman-core'

# Extension namespace
class PiwikExtension < ::Middleman::Extension
  option :domain, 'localhost.com', 'An example url for piwik'
  option :url, 'piwik', 'An example path to your piwik installation'
  option :id, 1, 'The id for piwik'

  def after_configuration
    app.config[:piwik_domain] = options.domain
    app.config[:piwik_url] = options.url
    app.config[:piwik_id] = options.id
  end

  helpers do
    def piwik
      <<END
      <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
          var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{config[:piwik_domain]}/#{config[:piwik_url]}/";
        _paq.push(['setTrackerUrl', u+'piwik.php']);
        _paq.push(['setSiteId', 1]);
        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
        g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
      </script>
      <noscript><p><img src="https://#{config[:piwik_domain]}/#{config[:piwik_url]}/piwik.php?idsite=#{config[:piwik_id]}" style="border:0;" alt="" /></p></noscript>
END
    end
  end
end
