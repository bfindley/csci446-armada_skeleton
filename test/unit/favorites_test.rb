require 'test_helper'

class FavoritesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Favorites.new.valid?
  end
end
