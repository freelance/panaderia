class Provider < ActiveRecord::Base
  belongs_to :store
  has_many :expenses
  has_many :invoices, as: :invoiceable
end
