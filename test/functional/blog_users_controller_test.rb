require 'test_helper'

class BlogUsersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_users)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_blog_user
    assert_difference('BlogUser.count') do
      post :create, :blog_user => { }
    end

    assert_redirected_to blog_user_path(assigns(:blog_user))
  end

  def test_should_show_blog_user
    get :show, :id => blog_users(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => blog_users(:one).id
    assert_response :success
  end

  def test_should_update_blog_user
    put :update, :id => blog_users(:one).id, :blog_user => { }
    assert_redirected_to blog_user_path(assigns(:blog_user))
  end

  def test_should_destroy_blog_user
    assert_difference('BlogUser.count', -1) do
      delete :destroy, :id => blog_users(:one).id
    end

    assert_redirected_to blog_users_path
  end
end
