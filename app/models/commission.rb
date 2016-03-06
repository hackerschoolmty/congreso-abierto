class Commission < ActiveRecord::Base
  belongs_to :commission_topic
  belongs_to :legislature

  has_many :commission_representatives

  validates :legislature_id, :name, :commission_topic_id, presence: true
end
