class Tool < ApplicationRecord
  has_many :user_tool_associations, dependent: :destroy
  has_many :users, through: :user_tool_associations
  belongs_to :category

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
