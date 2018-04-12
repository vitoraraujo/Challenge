class User < ApplicationRecord
	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_many :challenges, dependent: :destroy

	has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy

	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships
	
	has_secure_password

	def feed
	    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id" 
	    
	    Challenge.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)

	end

	# Follows a user.
	def follow(other_user)
	  following << other_user
	end

	# Unfollows a user.
	def unfollow(other_user)
	  following.delete(other_user)
	end

	# Returns true if the current user is following the other user.
	def following?(other_user)
	  following.include?(other_user)
	end

	def self.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end
end
