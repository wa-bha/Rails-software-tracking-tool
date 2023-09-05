class User < ApplicationRecord
  has_many :user_tool_associations, dependent: :destroy
  has_many :tools, through: :user_tool_associations

  def self.search(query)
    where("full_name LIKE ?", "%#{query}%")
  end
end
