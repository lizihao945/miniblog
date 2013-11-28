require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get new" do
    get :new
    assert_redirected_to index_url
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end
end
