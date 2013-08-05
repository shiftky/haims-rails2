module ApplicationHelper
  def active_path?(path)
    return "active" if request.path_info.include?(path)
  end
end
