require 'test_helper'

class PageviewsControllerTest < ActionController::TestCase
  setup do
    @pageview = pageviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pageviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pageview" do
    assert_difference('Pageview.count') do
      post :create, pageview: { post_id: @pageview.post_id, user_ip: @pageview.user_ip }
    end

    assert_redirected_to pageview_path(assigns(:pageview))
  end

  test "should show pageview" do
    get :show, id: @pageview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pageview
    assert_response :success
  end

  test "should update pageview" do
    patch :update, id: @pageview, pageview: { post_id: @pageview.post_id, user_ip: @pageview.user_ip }
    assert_redirected_to pageview_path(assigns(:pageview))
  end

  test "should destroy pageview" do
    assert_difference('Pageview.count', -1) do
      delete :destroy, id: @pageview
    end

    assert_redirected_to pageviews_path
  end
end
