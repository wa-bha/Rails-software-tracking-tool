class AddCategoryReferenceToTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :tools, :category, null: true, foreign_key: true
  end
end
