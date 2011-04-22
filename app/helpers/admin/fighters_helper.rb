module Admin::FightersHelper
  
  def fighters_list(fighters)
    if fighters.empty?
      content_tag :p do
        "No users."
      end
    else
      render :partial => 'table', :locals => {:fighters => fighters}
    end
  end
  
end
