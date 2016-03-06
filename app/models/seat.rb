class Seat < ActiveRecord::Base
  has_many :legislature_representatives
end
