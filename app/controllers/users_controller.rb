class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @containers = @user.containers.reject{|c| c.staging?}
    @staging = @user.containers.select{|c| c.staging?}
    @link = Link.new
  end

  def index
    # @users = User.all
    @users = User.where(:public_status => true)
  end

#   def update
#     @user = User.find(params[:id])
#     @user.update_attributes!(user_params)
#     redirect_to @user
#   end

# private
#   def user_params
#     params.require(:user).permit(:public_status)
#   end
end



