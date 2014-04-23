require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class CheckHttpMethodAllowedTest < Test::Unit::TestCase

  App = lambda { |env| [200, {'Content-Type' => 'text/plain'}, Rack::Request.new(env)] } 

  def test_allowed_request
    env = request_env('GET')
    middleware = Rack::CheckHttpMethodAllowed.new(App, ['GET'])
    status, headers, body = middleware.call(env)
    assert_equal 200, status
  end

  def test_allowed_request_without_method_list
    env = request_env('GET')
    middleware = Rack::CheckHttpMethodAllowed.new(App)
    status, headers, body = middleware.call(env)
    assert_equal 200, status
  end

  def test_not_allowed_request
    env = request_env('GET')
    middleware = Rack::CheckHttpMethodAllowed.new(App, ['POST','PUT','PATCH','DELETE'])
    status, headers, body = middleware.call(env)
    assert_equal 405, status
    assert_equal 'Method Not Allowed', body.join
  end

  def test_not_allowed_request_without_method_list
    env = request_env('PROPFIND')
    middleware = Rack::CheckHttpMethodAllowed.new(App)
    status, headers, body = middleware.call(env)
    assert_equal 405, status
    assert_equal 'Method Not Allowed', body.join
  end

  private

  def request_env(method)
    Rack::MockRequest.env_for('/', {:method => method})
  end

end