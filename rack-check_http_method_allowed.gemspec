# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/check_http_method_allowed/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-check_http_method_allowed"
  spec.version       = Rack::CheckHttpMethodAllowed::VERSION
  spec.authors       = ["David Jones"]
  spec.email         = ["david@getfretless.com"]
  spec.summary       = %q{Rack middleware to check HTTP request methods and reject ones Rails cannot handle}
  spec.description   = %q{Rails maintains a list of HTTP verbs that it can handle in ActionController::Request::HTTP_METHODS, and will 500 if it gets a request it cannot understand. This will log and filter them out, so you don't get unneccessary notification from your exception tracker}
  spec.homepage      = "https://github.com/getfretless/rack-check_http_method_allowed"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
