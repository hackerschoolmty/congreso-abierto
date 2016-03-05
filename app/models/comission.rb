class Comission < ActiveRecord::Base
  belongs_to :comission_topic
  belongs_to :legislature
end
