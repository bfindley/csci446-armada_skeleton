module FavoritesHelper

  def favorite_toggle(active, path)
    
    toggle_on_image = image_tag('icon_small_star.png', :style => (active ? "" : "display:none"), :class => "star_on")
    
    toggle_on_text = content_tag(:span, 'added to favorites', :style => "position: absolute; bottom: -20px; left: -20px; display:none; width: 120px;", :class => "star_on_msg")
    
    toggle_off_image = image_tag('icon_small_star_inactive.png', :style => (active ? "display:none" : ""), :class => "star_off")
    
    toggle_off_text = content_tag(:span, 'removed from favorites', :style => "position: absolute; bottom: -20px; left: -20px; display:none; width: 150px;", :class => "star_off_msg")
    
    
    link_to(toggle_on_image+toggle_on_text+toggle_off_image+toggle_off_text,
      path,
      'data-method' => :put,
      'data-remote' => true,
      :onclick => '
        $(".star_on", this).toggle(0, function(){
          if($(this).is(":visible"))
            $(".star_on_msg", this.parentNode).fadeToggle(500, function(){
              $(".star_on_msg", this.parentNode).fadeToggle(2000);
            });
        });
        $(".star_off", this).toggle(0, function(){
          if($(this).is(":visible"))
            $(".star_off_msg", this.parentNode).fadeToggle(500, function(){
              $(".star_off_msg", this.parentNode).fadeToggle(2000);
            });
        });',
      :title => "toggle as a favorite",
      :style => "text-decoration: none; position: relative;")
  end

end
