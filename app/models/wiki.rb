class Wiki < ActiveRecord::Base
  has_many :users
  belongs_to :user

  scope :default_order, -> () { order('wikis.created_at DESC') }
end
