class Blog < ApplicationRecord
	validates :title, presence: true, length: { minimum: 3, maximum: 30}

	validates :content, presence: true

	has_many :comments
end
