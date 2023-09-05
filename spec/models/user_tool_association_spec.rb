require "rails_helper"

RSpec.describe UserToolAssociation, type: :model do
  it "is valid with a user and a tool" do
    user = User.create(full_name: "Alice Smith")
    tool = Tool.create(name: "Visual Studio Code")
    association = UserToolAssociation.new(user: user, tool: tool)

    expect(association).to be_valid
  end

  it "is invalid without a user" do
    tool = Tool.create(name: "Visual Studio Code")
    association = UserToolAssociation.new(user: nil, tool: tool)
    association.valid?

    expect(association.errors[:user]).to include("must exist")
  end

  it "is invalid without a tool" do
    user = User.create(full_name: "Alice Smith")
    association = UserToolAssociation.new(user: user, tool: nil)
    association.valid?

    expect(association.errors[:tool]).to include("must exist")
  end
end
