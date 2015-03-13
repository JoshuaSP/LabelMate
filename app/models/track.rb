class Track < ActiveRecord::Base
  validates_presence_of :name, :album_id
  validates :bonus_track, inclusion: { in: [true, false] }

  belongs_to :album
end
