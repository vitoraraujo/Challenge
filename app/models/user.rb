class User < ApplicationRecord
	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_many :challenges	
	has_secure_password

	def self.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
	end
end
