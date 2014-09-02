class Question < ActiveRecord::Base
	has_many :answers

	validates :title, presence: true, length: { in: 3..30 }
	validates :content, presence: true, length: { in: 5..140 }
end