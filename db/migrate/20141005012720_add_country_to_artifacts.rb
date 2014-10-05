class AddCountryToArtifacts < ActiveRecord::Migration
  def change
    add_column :artifacts, :country, :string
  end
end
