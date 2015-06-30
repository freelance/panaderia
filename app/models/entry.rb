class Entry < ActiveRecord::Base
  belongs_to :store
  
 scope :manana, ->{where("entries.date IS NULL")}

end
