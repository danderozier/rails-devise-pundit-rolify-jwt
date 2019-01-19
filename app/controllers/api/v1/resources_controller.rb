class Api::V1::ResourcesController < Api::V1::ApiController
  before_action :authenticate_user!

  def index
    @resources = authorize Resource.all
    render json: @resources
  end

  def show
    @resource = authorize Resource.find(params[:id])
    render json: @resource
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
