module ApplicationHelper
  def active_path?(path)
    return "active" if request.path_info == path
  end
end
