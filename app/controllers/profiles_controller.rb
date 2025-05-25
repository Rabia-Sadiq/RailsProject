class ProfilesController < ApplicationController
  before_action :set_user

  def show
    # @user is set in before_action
  end

  def edit
    # @user is set in before_action, used in form
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def profile_params
  params.require(:user).permit(:name, :weight, :height)
end

end
