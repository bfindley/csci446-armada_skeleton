require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Favorites.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Favorites.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Favorites.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to favorites_url(assigns(:favorites))
  end

  def test_edit
    get :edit, :id => Favorites.first
    assert_template 'edit'
  end

  def test_update_invalid
    Favorites.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Favorites.first
    assert_template 'edit'
  end

  def test_update_valid
    Favorites.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Favorites.first
    assert_redirected_to favorites_url(assigns(:favorites))
  end

  def test_destroy
    favorites = Favorites.first
    delete :destroy, :id => favorites
    assert_redirected_to favorites_url
    assert !Favorites.exists?(favorites.id)
  end
end
