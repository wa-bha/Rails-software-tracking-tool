require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a full name" do
    user = User.new(full_name: "John Doe")
    expect(user).to be_valid
  end

  it "is invalid without a full name" do
    user = User.new(full_name: nil)
    user.valid?
    expect(user.errors[:full_name]).to include("can't be blank")
  end

  it "can have tools associated with it" do
    user = User.create(full_name: "Alice Smith")
    tool = Tool.create(name: "Visual Studio Code")
    user.tools << tool

    expect(user.tools).to include(tool)
  end

  it "can be searched by full name" do
    user1 = User.create(full_name: "John Doe")
    user2 = User.create(full_name: "Jane Smith")

    search_result = User.search("John")
    expect(search_result).to include(user1)
    expect(search_result).not_to include(user2)
  end
end
