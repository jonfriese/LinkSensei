class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :load_container
  before_action :find_containers

  def index
    # @links = @container.links.order(updated_at: :desc)
  end

  def new
    @link = @container.links.new
  end

  def show
  end

  def edit
    @link = @container.links.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    # @link = @container.links.new(link_params)
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        # @container.links << @link
        format.html { redirect_to user_path(current_user), notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        message = @link.errors.full_messages[0]
        format.html { redirect_to user_path(current_user), alert: message  }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to user_path(current_user), notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        message = @link.errors.full_messages[0]

        format.html { redirect_to user_path(current_user), alert: message  }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:name, :url, :description, :container_id)
  end

  def load_container
    @container = Container.find(params[:container_id])
  end

  def find_containers
    @all_containers = Container.all
    @containers_list = Container.where(user_id: current_user.id)
  end
end
