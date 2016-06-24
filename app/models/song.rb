class Song < ActiveRecord::Base
	has_many :songlist
	has_many :users, through: :songlist

	validates :title, :artist, presence: true
	validates_length_of :title, :artist, minimum: 2


end
