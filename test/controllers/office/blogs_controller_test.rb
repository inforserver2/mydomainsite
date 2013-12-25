require 'test_helper'

class Office::BlogsControllerTest < ActionController::TestCase
  setup do
    @office_blog = office_blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:office_blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office_blog" do
    assert_difference('Office::Blog.count') do
      post :create, office_blog: { title: @office_blog.title }
    end

    assert_redirected_to office_blog_path(assigns(:office_blog))
  end

  test "should show office_blog" do
    get :show, id: @office_blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office_blog
    assert_response :success
  end

  test "should update office_blog" do
    patch :update, id: @office_blog, office_blog: { title: @office_blog.title }
    assert_redirected_to office_blog_path(assigns(:office_blog))
  end

  test "should destroy office_blog" do
    assert_difference('Office::Blog.count', -1) do
      delete :destroy, id: @office_blog
    end

    assert_redirected_to office_blogs_path
  end
end
