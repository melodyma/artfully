class AddImageToArtifacts < ActiveRecord::Migration
  def change
    add_column :artifacts, :image, :string
    add_column :artifacts, :remote_image_url, :string
  end
end
