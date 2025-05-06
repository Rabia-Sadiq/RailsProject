class SessionsController < ApplicationController
  def destroy
    logout current_user
    redirect_to root_path,notice: "you have been logged out"
  end
end