# Rack::CheckHttpMethodAllowed

Rack middleware to check HTTP request methods and reject ones you don't want.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-check_http_method_allowed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-check_http_method_allowed

## Usage

In `config/application.rb` inside the main configuration block, add the line:

    config.middleware.use 'Rack::CheckHttpMethodAllowed'

By default, this middleware only allows through methods conforming to [RFC2616](http://www.ietf.org/rfc/rfc2616.txt) and [RFC5789](http://www.ietf.org/rfc/rfc5789.txt), which should cover most applications, since the rest are mainly for [WebDAV](http://en.wikipedia.org/wiki/WebDAV) support.

If you need to support a different set of HTTP methods, you can pass them in like so:

    config.middleware.use 'Rack::CheckHttpMethodAllowed', ['GET', 'POST', 'SOMETHINGELSE']

and any methods not listed will be rejected.

Rails maintains a list of HTTP verbs that it can handle in [ActionController::Request::HTTP_METHODS](https://github.com/rails/rails/blob/4-1-stable/actionpack/lib/action_dispatch/http/request.rb#L76), (including WebDAV methods), you can use this instead like so:

    config.middleware.use 'Rack::CheckHttpMethodAllowed', ActionController::Request::HTTP_METHODS

## Contributing

1. Fork it ( http://github.com/getfretless/rack-check_http_method_allowed/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
