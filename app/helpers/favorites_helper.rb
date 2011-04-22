module FavoritesHelper

  def favorite_toggle(active, path)
    link_to(
      image_tag('icon_small_star.png', :style => (active ? "" : "display:none"), :id => "star_on")+
      image_tag('icon_small_star_inactive.png', :style => (active ? "display:none" : ""), :id => "star_off"),
      path,
      'data-method' => :put,
      'data-remote' => true,
      :onclick => '$("#star_on", this).toggle();$("#star_off", this).toggle();',
      :title => "toggle as a favorite")
  end

end
