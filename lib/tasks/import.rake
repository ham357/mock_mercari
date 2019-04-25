require 'csv'

# rake import:categories
namespace :import do
  desc "Import categories from csv"

  task categories: :environment do
    path = File.join Rails.root, "db/csv/category_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          main_category_id: row["main_category_id"],
          sub_category_id: row["sub_category_id"],
          sub_subcategory_id: row["sub_subcategory_id"]
      }
    end
    puts "start to create category data"
    begin
      Category.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end