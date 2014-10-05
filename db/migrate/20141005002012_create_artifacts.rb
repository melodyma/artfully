class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string :title
      t.string :artist
      t.string :city
      t.text :description
      
      t.timestamps
    end
  end
end
