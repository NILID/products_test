module ApplicationHelper

  ##
  # Add 
  def flash_class(level)
    css_prefix = case level
      when 'notice'  then 'info'
      when 'success' then 'success'
      when 'error' || 'alert'
                     then 'danger'
    end
    "alert alert-#{css_prefix}"
  end
end
