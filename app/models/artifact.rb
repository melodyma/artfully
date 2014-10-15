class Artifact < ActiveRecord::Base

  validates :title, presence: true
  validates :country, presence: true
  validates :city, presence: true
  # validates :image, presence: true

  # mount_uploader :image, ImageUploader

  scope :by_query, ->(query) { where( "title LIKE :q OR artist LIKE :q", q: "%#{query}" ) }
  scope :by_city_or_country, ->(city, country) { where( "city = ? OR country = ?", city, country ) }

  def self.search(query, city, country)
    full_query = Artifact
    full_query = full_query.by_query(query) if query.present?
    full_query = full_query.by_city_or_country(city, country) if city.present? || country.present?
    return full_query
  end

  def self.unique_by_city
    self.select(:city).distinct
  end

  def self.unique_by_country
    self.select(:country).distinct
  end

  def image_url
    remote_image_url
  end

end
