class Album < ActiveRecord::Base
  validates_presence_of :name, :band_id
  validates :live_album, inclusion: { in: [true, false] }

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
