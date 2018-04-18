class Comment < ApplicationRecord
	belongs_to :challenge
	belongs_to :user

	validates :user_id, presence: true
	validates :challenge_id, presence: true
	validates :comment, presence: true, length: { maximum: 350 }
end
