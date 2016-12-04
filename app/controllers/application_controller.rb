class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_browser_lists
    session[:current_browser_lists] ||= []
  end
end
