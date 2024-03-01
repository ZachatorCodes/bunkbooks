class ApplicationController < ActionController::API
  include ActionController::Cookies

  # Test method to confirm cookie and session middleware functionality
  def hello_world
    session[:count] = (session[:count] || 0) + 1
    render json: { count: session[:count] }
  end
end
