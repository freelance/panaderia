class Product < ActiveRecord::Base
  has_and_belongs_to_many :clients, join_table: :clients_products
  has_and_belongs_to_many :orders, join_table: :orders_products 
end
