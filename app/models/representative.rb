class Representative < ActiveRecord::Base
  #voted= Votado, pluri = plurinominal
  enum representative_type: [ :voted, :pluri ]
  
end
