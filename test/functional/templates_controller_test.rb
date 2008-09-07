require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_template
    assert_difference('Template.count') do
      post :create, :template => { }
    end

    assert_redirected_to template_path(assigns(:template))
  end

  def test_should_show_template
    get :show, :id => templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => templates(:one).id
    assert_response :success
  end

  def test_should_update_template
    put :update, :id => templates(:one).id, :template => { }
    assert_redirected_to template_path(assigns(:template))
  end

  def test_should_destroy_template
    assert_difference('Template.count', -1) do
      delete :destroy, :id => templates(:one).id
    end

    assert_redirected_to templates_path
  end
end
