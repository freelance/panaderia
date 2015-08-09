class Entry < ActiveRecord::Base
  belongs_to :store, :inverse_of => :entries
  has_many :bills
  accepts_nested_attributes_for :bills
  

  just_define_datetime_picker :date
  validates :date, :presence => true
  
  TIME_OF_DAY = %w(mañana tarde)
   
 end
