class Comment < ApplicationRecord
	validates :user, presence: true
	validates :blog, presence: true
	validates :content, presence: true

	belongs_to :user
	belongs_to :blog
end
