class OriginalIdea < ApplicationRecord
  has_many :idea_chain_original_ideas, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200 }
end
