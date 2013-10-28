class ContainersController < ApplicationController
  before_action :set_container, only: [:show, :edit, :update, :destroy]
  before_action :load_user

  # GET /containers
  # GET /containers.json
  def index
    @containers = @user.containers.all
  end

  # GET /containers/1
  # GET /containers/1.json
  def show
    @container = @user.containers
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
        format.html { redirect_to [@user, @container], notice: 'Container was successfully created.' }
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
    respond_to do |format|
      if @container.update(container_params)
        format.html { redirect_to [@user, @container], notice: 'Container was successfully updated.' }
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
      format.html { redirect_to user_containers_url }
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
      params.require(:container).permit[:description]
    end

    def load_user
      @user = User.find(params[:user_id])
    end
end
