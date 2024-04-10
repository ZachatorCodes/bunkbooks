class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  # login function
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password]) # authenticate comes from BCrypt
      # adds user id to session after login
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  # logout function
  def destroy
    session.delete :user_id
    head :no_content
  end
end
