class Question < ActiveRecord::Base

	belongs_to :exam

	validates :question, presence: true
end
