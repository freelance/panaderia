class Tarea < ActiveRecord::Base
  belongs_to :provider
  belongs_to :store
end
