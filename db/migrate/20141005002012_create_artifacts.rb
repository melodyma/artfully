class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|

      t.timestamps
    end
  end
end
