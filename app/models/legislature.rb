class Legislature < ActiveRecord::Base
  enum status: [:inactive, :active]

  has_many :legislature_representatives
end
