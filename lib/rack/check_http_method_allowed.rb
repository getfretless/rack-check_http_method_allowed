require 'rack/check_http_method_allowed/version'

module Rack
  class CheckHttpMethodAllowed

    RFC2616 = %w(OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT)
    RFC5789 = %w(PATCH)
    DEFAULT = RFC2616 + RFC5789

    def initialize(app, allowed_methods=nil)
      @app = app
      @allowed_methods = allowed_methods || DEFAULT
    end

    def call(env)
      if method_not_allowed?(env['REQUEST_METHOD'])
        reject_request(env)
      else
        @app.call(env)
      end
    end

    private

    def method_not_allowed?(request_method)
      !@allowed_methods.include?(request_method.upcase)
    end

    def log_rejection(env)
      message = "Rack::CheckHttpMethodAllowed Method Not Allowed: #{env.inspect}"
      Rails.logger.info(message) if defined?(Rails)
    end

    def reject_request(env)
      log_rejection(env)
      [405, {'Content-Type' => 'text/plain'}, ['Method Not Allowed']]
    end

  end
end
