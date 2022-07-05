class SessionsController < ApplicationController

  def new
  end

  def create
    # If the user exists AND the password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how # to keep the user logged in when they navigate around the # site.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user login doesn't work, redirect back to login.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
