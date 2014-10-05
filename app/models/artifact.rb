class Artifact < ActiveRecord::Base

  validates :title, presence: true
  validates :country, presence: true
  validates :city, presence: true

  scope :by_query, ->(query) { where( "title LIKE :q OR artist LIKE :q", q: "%#{query}" ) }
  scope :by_city, ->(city) { where( "city = ?", city ) }
  scope :by_country, ->(country) { where( "country = ?", country) }

  def self.search(query, city, country)
    full_query = Artifact
    full_query = full_query.by_query(query) if query.present?
    full_query = full_query.by_city(city) if city.present?
    full_query = full_query.by_country(country) if country.present?
  end

end
