class Category < ApplicationRecord
  has_many :tools

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
