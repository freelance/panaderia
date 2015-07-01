class Entry < ActiveRecord::Base
  belongs_to :store, :inverse_of => :entries
  
 end
