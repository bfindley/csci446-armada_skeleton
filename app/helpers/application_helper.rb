module ApplicationHelper

  def admin_menu_items(user)
    render :partial => 'layouts/admin_menu_items' if user.is_admin?
  end
  
  def member_menu_items(user)
    render :partial => 'layouts/member_menu_items' if user.is_member?
  end

  def menubar(user)
    render :partial => 'layouts/menubar' if user
  end
  
  def userbar(user)
    if user
      render :partial => 'layouts/userbar'
    else
      render :partial => 'layouts/loginbar'
    end
  end
  
  def google_webfont_stylesheet(face)
    "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=#{face}\" />"
  end
  
  def sample_with_more(body, max, html_options = {})
    if body.length < max
      return content_tag(:div, html_options) { body }
    end
    
    more_link = link_to_function("more...", "$(this).hide(); $('.hidden', this.parentNode).show();")

    content_tag(:div, html_options) do 
      body[0..(max-1)] + " " + more_link + 
        content_tag(:span, body[max..-1], :style => "display:none", :class => "hidden")
    end
  end

    
end
