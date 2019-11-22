require 'test_helper'

class SecretSantaGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get secret_santa_games_new_url
    assert_response :success
  end

  test "should get create" do
    get secret_santa_games_create_url
    assert_response :success
  end

  test "should get show" do
    get secret_santa_games_show_url
    assert_response :success
  end

end
