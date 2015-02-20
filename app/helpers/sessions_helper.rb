module SessionsHelper
  def current_library
	@current_library ||= Library.find_by(id: session[:library_id])
  end
end