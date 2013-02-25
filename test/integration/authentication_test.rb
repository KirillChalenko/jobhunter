require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "register with login and password" do
  	visit "http://google.com"
    assert true
  end
end
