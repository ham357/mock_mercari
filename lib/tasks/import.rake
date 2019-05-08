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

# rake import:brands
namespace :import do
  desc "Import brands from csv"

  task brands: :environment do
    path = File.join Rails.root, "db/csv/brand_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"]
      }
    end
    puts "start to create brand data"
    begin
      Brand.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end

# rake import:product_sizes
namespace :import do
  desc "Import product_sizes from csv"

  task product_sizes: :environment do
    path = File.join Rails.root, "db/csv/product_size_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          product_size_id: row["product_size_id"]
      }
    end
    puts "start to create product_size data"
    begin
      ProductSize.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end

# rake import:product_shipping_fees
namespace :import do
  desc "Import product_shipping_fees from csv"

  task product_shipping_fees: :environment do
    path = File.join Rails.root, "db/csv/product_shipping_fee_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
      }
    end
    puts "start to create product_shipping_fee data"
    begin
      ProductShippingFee.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end

# rake import:product_shipping_methods
namespace :import do
  desc "Import product_shipping_methods from csv"

  task product_shipping_methods: :environment do
    path = File.join Rails.root, "db/csv/product_shipping_method_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          shipping_fee_category: row["shipping_fee_category"]
      }
    end
    puts "start to create product_shipping_method data"
    begin
      ProductShippingMethod.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
