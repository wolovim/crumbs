class Answer < ActiveRecord::Base
	belongs_to :question

	validates :body, presence: true, length: { in: 2..700 }
end