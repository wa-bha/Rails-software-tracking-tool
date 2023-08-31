class Tool < ApplicationRecord
  has_many :user_tool_associations
  has_many :users, through: :user_tool_associations
end
