class UsersController < ApplicationController

  def show
    @user = current_user
    @offers = @user.offers
    @reservations = @user.reservations
  end

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end
end
