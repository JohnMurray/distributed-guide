require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic,
      :root => '_site',  # static file root directory
      :urls => %w[/],    # match all requests
      :try  => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

notFound = File.open('_site/index.html').read
run lambda { |_| [200, {'Content-Type' => 'text/html'}, [notFoundPage]]}
