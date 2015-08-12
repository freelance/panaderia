class Client < ActiveRecord::Base
  has_and_belongs_to_many :products, join_table: :clients_products
  has_many :orders
end
