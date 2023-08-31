class Tool < ApplicationRecord
  has_many :user_tool_associations, dependent: :destroy
  has_many :users, through: :user_tool_associations
end
