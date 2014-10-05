class Artifact < ActiveRecord::Base

  validates :title, presence: true
  validates :country, presence: true
  validates :city, presence: true

end
