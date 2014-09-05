class Position < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true
	validates :company, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
end