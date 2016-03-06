class Representative < ActiveRecord::Base
  #voted= Votado, pluri = plurinominal
  enum representative_type: [ :voted, :pluri ]

  has_many :commission_representatives
  has_many :legislature_representatives
  has_many :votes
end
