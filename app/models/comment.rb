class Comment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
    belongs_to :user
	belongs_to :blog

	validates :user, presence: true
	validates :blog, presence: true
	validates :content, presence: true

end
