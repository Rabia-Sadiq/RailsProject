class SessionsController < ApplicationController
  def new
  end

def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      login user
      if user.undertone.blank?
        redirect_to undertone_quiz_path, notice: "Please take the undertone quiz to personalize your experience."
      else
        redirect_to root_path, notice: "You have signed in successfully"
      end
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
end


  def destroy
    logout current_user
    redirect_to root_path, notice: "You have been logged out"
  end
end
