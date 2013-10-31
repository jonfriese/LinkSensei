class ContainersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_container, only: [:show, :edit, :update, :destroy]
  before_action :load_user

  # GET /containers
  # GET /containers.json
  def index
    @containers = @user.containers.load
  end

  # GET /containers/1
  # GET /containers/1.json
  def show
  end

  # GET /containers/new
  def new
    @container = @user.containers.new
  end

  # GET /containers/1/edit
  def edit
  end

  # POST /containers
  # POST /containers.json
  def create
    @container = @user.containers.new(container_params)
    @container.user_id = @user.id

    respond_to do |format|
      if @container.save
        current_user.containers << @container
        format.html { redirect_to user_path(@user), notice: 'Container was successfully created.' }
        format.json { render action: 'show', status: :created, location: @container }
      else
        format.html { render action: 'new' }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containers/1
  # PATCH/PUT /containers/1.json
  def update
    authorize @container
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
    authorize @container
    @container.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def container_params
      params.require(:container).permit(:name, :description)
    end

    def load_user
      @user = User.find(params[:user_id])
    end
end
