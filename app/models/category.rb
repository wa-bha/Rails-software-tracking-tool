class Category < ApplicationRecord
  has_many :tools

  validates :name, presence: true

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
