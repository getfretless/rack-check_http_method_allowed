# Rack::CheckHttpMethodAllowed

Rack middleware to check HTTP request methods and reject ones Rails cannot handle

Rails maintains a list of HTTP verbs that it can handle in `ActionController::Request::HTTP_METHODS`, and will 500 if it gets a request it cannot understand.
This will log and filter them out, so you don't get unneccessary notification from your exception tracker.

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

## Contributing

1. Fork it ( http://github.com/getfretless/rack-check_http_method_allowed/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
