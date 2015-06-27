class Store < ActiveRecord::Base
  has_many :providers
  has_many :expenses
end
