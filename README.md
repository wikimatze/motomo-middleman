# Piwik-Middleman

It's an extension for the [Middleman](http://middlemanapp.com/) static site generator
to use  [Piwik](https://piwik.org/).


## Installation


Clone the repository `git clone git@github.com:wikimatze/piwik-middleman.git ~/git/piwik-middleman`.
Then add the following line to your `Gemfile`:


```ruby
gem 'piwik-middleman', path: "/home/wm/git/piwik-middleman/"
```

Run `bundle install`.


## Configuration

In your `config.rb` you can configure the settings as follow:

```ruby
activate :piwikmiddleman do |p|
  p.domain = 'vimberlin.de'
  p.url = 'piwik'
  p.id = 1
end
```


## Helper

This plugin will add the following helper method:

```erb
<%= piwik %>
```


which will expand to


```erb
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
  var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{config[:piwik_domain]}/#{config[:piwik_url]}/";
  _paq.push(['setTrackerUrl', u+'piwik.php']);
  _paq.push(['setSiteId', 1]);
  var d=document, g=d.createElement('script'),
  s=d.getElementsByTagName('script')[0];
  g.type='text/javascript';
  g.defer=true; g.async=true;
  g.src=u+'piwik.js';
  s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="https://#{config[:piwik_domain]}/#{config[:piwik_url]}/piwik.php?idsite=#{config[:piwik_id]}" style="border:0;" alt="" /></p></noscript>
```

