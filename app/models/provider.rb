class Provider < ActiveRecord::Base
  belong_to :store
  has_many :tareas
  has_many :expenses
end
