User.create(full_name: "John Doe")
User.create(full_name: "Jane Smith")
User.create(full_name: "Alice Johnson")
User.create(full_name: "Bob Brown")
User.create(full_name: "Ella Wilson")
User.create(full_name: "David Lee")
User.create(full_name: "Emily Davis")
User.create(full_name: "Michael White")
User.create(full_name: "Olivia Turner")
User.create(full_name: "Sophia Moore")

Category.create(name: "Text Editor")
Category.create(name: "IDE (Integrated Development Environment)")
Category.create(name: "Web Browser")
Category.create(name: "Graphics Software")
Category.create(name: "Database Management")

# Text Editors
Tool.create(name: "Visual Studio Code", category_id: 1)
Tool.create(name: "Sublime Text", category_id: 1)
Tool.create(name: "Notepad++", category_id: 1)

# IDEs
Tool.create(name: "Eclipse", category_id: 2)
Tool.create(name: "IntelliJ IDEA", category_id: 2)
Tool.create(name: "PyCharm", category_id: 2)

# Web Browsers
Tool.create(name: "Google Chrome", category_id: 3)
Tool.create(name: "Mozilla Firefox", category_id: 3)
Tool.create(name: "Microsoft Edge", category_id: 3)

# Graphics Software
Tool.create(name: "Adobe Photoshop", category_id: 4)
Tool.create(name: "Illustrator", category_id: 4)
Tool.create(name: "GIMP", category_id: 4)

# Database Management
Tool.create(name: "MySQL Workbench", category_id: 5)
Tool.create(name: "phpMyAdmin", category_id: 5)
Tool.create(name: "MongoDB Compass", category_id: 5)

user_ids = User.pluck(:id)
tool_ids = Tool.pluck(:id)

25.times do
  UserToolAssociation.create(
    user_id: user_ids.sample,
    tool_id: tool_ids.sample,
  )
end
