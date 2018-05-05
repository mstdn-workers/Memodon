class User < ActiveRecord::Base
  has_many :memo

  accepts_nested_attributes_for :memo

  validates :username, presence: true
end
