require "rails_helper"

RSpec.describe Tool, type: :model do
  let!(:category) { Category.create(name: "Text Editor") }

  it "is valid with a name and a category" do
    tool = Tool.new(name: "Visual Studio Code", category: category)
    expect(tool).to be_valid
  end

  it "is invalid without a name" do
    tool = Tool.new(name: nil)
    tool.valid?
    expect(tool.errors[:name]).to include("can't be blank")
  end

  it "can have users associated with it" do
    tool = Tool.create(name: "Visual Studio Code", category: category)
    user = User.create(full_name: "Alice Smith")
    tool.users << user

    expect(tool.users).to include(user)
  end

  it "can have a category associated with it" do
    tool = Tool.create(name: "DBeaver")
    db_category = Category.create(name: "Database Management")
    tool.category = db_category

    expect(tool.category).to eql(db_category)
  end

  it "can be searched by name" do
    tool1 = Tool.create(name: "Visual Studio Code", category: category)
    tool2 = Tool.create(name: "Sublime Text")

    search_result = Tool.search("Visual Studio")
    expect(search_result).to include(tool1)
    expect(search_result).not_to include(tool2)
  end
end
