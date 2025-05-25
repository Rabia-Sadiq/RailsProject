class ProfilesController < ApplicationController
  before_action :set_user

  def show
     @user
  end

  def update
    if @user.update(user_params)
      render json: { weight: @user.weight, height: @user.height }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user # or User.find(params[:id]) depending on your logic
  end

  def user_params
    params.require(:user).permit(:weight, :height)
  end
end
