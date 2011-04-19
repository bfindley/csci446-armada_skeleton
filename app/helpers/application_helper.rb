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
  
  #def insert_more_text(text, maxchars)
  #  
  #  page.insert_html :bottom, 
  #    "checked_task_items_#{task_list.id}", 
  #    :partial => 'tasks/checked_task',
  #    :locals => {  
  #      :checked_task => task,
  #      :calendar => calendar, 
  #      :task_list => task_list }
  #  
  #  
  #  more_link = link_to_function(" More...", "$('more').hide(); $('hidden').show();'", :id => 'more')
  #
  #
  #  content_tag(:div, html_options) do 
  #    body[0..49] + more_link + 
  #      content_tag(:span, body[50..-1], :style => "display:none", :id => "hidden")
  #  end
  #end
    
end
