class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user

  with_options presence: true do
    validates :room
    validates :user
  end
end
