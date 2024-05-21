class Tool < ApplicationRecord
  has_many :user_tool_associations, dependent: :destroy
  has_many :users, through: :user_tool_associations
  belongs_to :category, optional: true

  validates :name, presence: true

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
