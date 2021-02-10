class Idea < ApplicationRecord
  include SearchCop

  validates :title, presence: true, uniqueness: true

  search_scope :search do
    attributes :title
  end
end
