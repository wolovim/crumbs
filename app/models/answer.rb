class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	
	validates :body, presence: true, length: { in: 2..700 }
end