class ContainersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_container, only: [:show, :edit, :update, :destroy]
  before_action :load_user

  def index
    # @containers = @user.containers.load
  end

  def show
  end

  def new
    @container = @user.containers.new
  end

  def edit
  end

  # POST /containers
  # POST /containers.json
  def create
    @container = @user.containers.new(container_params)
    @container.user_id = @user.id
    @container.original_user_name = @user.name
    @container.clone_count = 0
    @container.parent_id = nil

    respond_to do |format|
      if @container.save
        current_user.containers << @container
        format.html { redirect_to user_path(@user), notice: 'Container was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containers/1
  # PATCH/PUT /containers/1.json
  def update
    respond_to do |format|
      if @container.update(container_params)
        format.html { redirect_to user_path(@user), notice: 'Container was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /containers/1
  # DELETE /containers/1.json
  def destroy
    @container.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user)}
      format.js
      format.json { head :no_content }
    end
  end

  def clone
    @container = Container.find(params[:container_id])
    @container.clone_count += 1
    @container.save!
    cloned_container = @container.amoeba_dup
    cloned_container.original_user_name = @container.original_user_name
    cloned_container.original_user_id = @container.user_id
    if @container.parent_id = nil
      cloned_container.parent_id = @container.id
    else
      cloned_container.parent_id = @container.parent_id
    end
    current_user.containers << cloned_container

    respond_to do |format|
      if cloned_container.save
        format.html { redirect_to user_path(@user), notice: 'Container was successfully created.' }
        format.json { render action: 'show', status: :created, location: cloned_container }
      else
        format.html { render action: 'new' }
        format.json { render json: cloned_container.errors, status: :unprocessable_entity }
      end
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_container
    @container = Container.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def container_params
    params.require(:container).permit(:name, :description, :starred)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
