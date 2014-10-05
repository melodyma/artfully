class ArtifactsController < ApplicationController

  def index
    if params[:query] || params[:city] || params[:country]
      @artifacts = Artifact.search(params[:query], params[:city], params[:country]).all
    else
      @artifacts = Artifact.all
    end
  end

  def show
    @artifact = Artifact.find(params[:id])
  end

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.new(artifact_params)

    if @artifact.save
      redirect_to artifacts_path
    else
      render :new
    end
  end


  protected

  def artifact_params
    params.require(:artifact).permit(
      :title, :artist, :country, :city, :description
    )
  end

end