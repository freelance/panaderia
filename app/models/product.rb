class Product < ActiveRecord::Base
  has_and_belongs_to_many :clients, join_table: :clients_products
end
