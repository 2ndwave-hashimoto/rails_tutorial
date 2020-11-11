class Blog < ApplicationRecord
	validates :title, presence: true, length: { in:3..30 }
	
	validates :content, presence: true

	has_many :comments, dependent: :destroy

	scope :search_blogs, ->(keyword) do
		#binding.pry 
		keyword_list = keyword.to_s.split((/\s+/)).map{ |keyword|"%#{keyword}%" }
		query = (["title like ?"] * keyword_list.size).join(" and ")
		where(query, * keyword_list)	
	end
	
	scope :data_from_narrow_down, -> (from) {where('created_at >= ?',from )}
	scope :data_to_narrow_down, -> (to){ where('created_at <= ?', to)}
	scope :data_from_to_narrow_down, ->(from, to){ where(created_at: from..to)}
	scope :recent, -> { order(created_at: :desc) }

	
	def self.data_narrow_down(from, to)
		return data_from_to_narrow_down(from, to) if from.present? && to.present?
		return data_from_narrow_down(from) if from.present?
		return data_to_narrow_down(to)
	end
end
