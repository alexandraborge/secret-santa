require 'test_helper'

class GreedyGrabBagGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get greedy_grab_bag_games_new_url
    assert_response :success
  end

  test "should get create" do
    get greedy_grab_bag_games_create_url
    assert_response :success
  end

  test "should get show" do
    get greedy_grab_bag_games_show_url
    assert_response :success
  end

end
