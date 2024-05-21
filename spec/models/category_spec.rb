require "rails_helper"

RSpec.describe Category, type: :model do
  it "is valid with a name" do
    category = Category.new(name: "Text Editor")
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = Category.new(name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it "can have tools associated with it" do
    category = Category.create(name: "Database Management")
    tool = Tool.create(name: "MySQL Workbench", category: category)

    expect(category.tools).to include(tool)
  end

  it "can be searched by name" do
    category1 = Category.create(name: "Text Editor")
    category2 = Category.create(name: "IDE")

    search_result = Category.search("Text")
    expect(search_result).to include(category1)
    expect(search_result).not_to include(category2)
  end
end
