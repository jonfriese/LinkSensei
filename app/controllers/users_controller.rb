class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user.id == current_user.id || @user.public_status == true
      redirect_to "/", alert: "You aren't authorized to view that page!"
    end
    @containers = @user.containers.order(updated_at: :desc).reject{|c| c.staging?}
    @containers = @containers.paginate(:page => params[:page], :per_page => 10)
    @staging = current_user.containers.select{|c| c.staging?}
    @link = Link.new
  end

  def index
    @users = User.where(:public_status => true).order(created_at: :desc).paginate(:page => params[:page], :per_page => 50)
    @users = @users.search(params[:search])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
