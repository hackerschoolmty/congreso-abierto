class Party < ActiveRecord::Base
  enum status: [:inactive, :active]
end
