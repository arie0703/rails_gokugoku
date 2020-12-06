require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest

  #一応標準テストフレームワークも使ってみる（基本RSpecでやってます）
  test "should get index" do
    get "/"
    assert_response :success
  end

end
