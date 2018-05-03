class Done < ApplicationRecord
	belongs_to :challenge
	belongs_to :user

	validates :user_id, presence: true
	validates :challenge_id, presence: true

	#For photo - special characeters \A, \z
	has_attached_file :photo, styles: {large:"450x450>", thumb: "50x50#"}
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	#For movie
	has_attached_file :movie, :styles =>
	{
		:medium => {:geometry => "640x480", :format => 'mp4'},
		:thumb => {:geometry => "100x50", :format =>'jpg', :time=> 10}
	}, :processor => [:transcoder]
	validates_attachment_content_type :movie, content_type: /\Avideo\/.*\z/

	acts_as_votable
end
