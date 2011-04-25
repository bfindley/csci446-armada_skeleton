module FavoritesHelper

  def favorite_toggle(active, path)
    link_to(
      image_tag('icon_small_star.png', :style => (active ? "" : "display:none"), :id => "star_on")+
      content_tag(:span, 'Favorite added.', :style => "position: absolute; bottom: -20px; left: -20px; display:none", :id => "star_on_msg")+
      image_tag('icon_small_star_inactive.png', :style => (active ? "display:none" : ""), :id => "star_off")+
      content_tag(:span, 'Favorite removed.', :style => "position: absolute; bottom: -20px; left: -20px; display:none", :id => "star_off_msg"),
      path,
      'data-method' => :put,
      'data-remote' => true,
      :onclick => '
        $("#star_on", this).toggle(0, function(){
          if($(this).is(":visible"))
            $("#star_on_msg", this.parentNode).slideToggle(500, function(){
              $("#star_on_msg", this.parentNode).slideToggle(3000);
            });
        });
        $("#star_off", this).toggle(0, function(){
          if($(this).is(":visible"))
            $("#star_off_msg", this.parentNode).slideToggle(500, function(){
              $("#star_off_msg", this.parentNode).slideToggle(3000);
            });
        });',
      :title => "toggle as a favorite",
      :style => "text-decoration: none; position: relative;")
  end

end
