require 'test_helper'

class CategoryPostsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:category_posts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_category_post
    assert_difference('CategoryPost.count') do
      post :create, :category_post => { }
    end

    assert_redirected_to category_post_path(assigns(:category_post))
  end

  def test_should_show_category_post
    get :show, :id => category_posts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => category_posts(:one).id
    assert_response :success
  end

  def test_should_update_category_post
    put :update, :id => category_posts(:one).id, :category_post => { }
    assert_redirected_to category_post_path(assigns(:category_post))
  end

  def test_should_destroy_category_post
    assert_difference('CategoryPost.count', -1) do
      delete :destroy, :id => category_posts(:one).id
    end

    assert_redirected_to category_posts_path
  end
end
