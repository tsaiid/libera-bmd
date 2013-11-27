module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end
end
