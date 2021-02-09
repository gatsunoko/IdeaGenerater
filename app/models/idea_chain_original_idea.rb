class IdeaChainOriginalIdea < ApplicationRecord
  belongs_to :idea, optional: :true
  belongs_to :original_idea, optional: :true
end
