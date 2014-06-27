class Movie < ActiveRecord::Base

	# We need to add a field (migration) for release_date

	# def self.released_before_2000
	# 	self.where("release_date < ?", 2000)
	# end
	validates :director, :title, presence: true
end


