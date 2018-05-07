class Memo < ActiveRecord::Base # :nodoc:
  belongs_to :user

  validates_presence_of :user

  validates :memo_status, presence: true
end
