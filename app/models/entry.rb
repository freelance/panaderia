class Entry < ActiveRecord::Base
  belongs_to :store, :inverse_of => :entries
  has_many :bills
  accepts_nested_attributes_for :bills
 end
