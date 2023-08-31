class User < ApplicationRecord
  has_many :user_tool_associations
  has_many :tools, through: :user_tool_associations
end
