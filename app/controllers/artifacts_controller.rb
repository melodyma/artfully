class ArtifactsController < ApplicationController

  def index
    @artifact = Artifact.new
    if params[:query] || params[:city] || params[:country]
      @artifacts = Artifact.search(params[:query], params[:city], params[:country]).all
    else
      @artifacts = Artifact.all.order('random()')
    end
  end

  def show
    @artifact = Artifact.find(params[:id])
  end

  def create
    @artifact = Artifact.new(artifact_params)

    if @artifact.save
      redirect_to artifacts_path
    else
      render :new
    end
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    @artifact = Artifact.find(params[:id])

    if @artifact.update_attributes(artifact_params)
      redirect_to artifact_path(@artifact)
    else
      render :edit
    end
  end


  protected

  def artifact_params
    params.require(:artifact).permit(
      :title, :artist, :country, :city, :description, :image, :remote_image_url
    )
  end

end