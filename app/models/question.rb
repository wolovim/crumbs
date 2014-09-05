class Question < ActiveRecord::Base
	has_many :answers
	has_many :taggings
	has_many :tags, through: :taggings
	belongs_to :user
	
	validates :title, presence: true, length: { in: 3..140 }
	validates :content, presence: true, length: { in: 5..700 }

	def <=>(other)
		other.score <=> score
	end
end