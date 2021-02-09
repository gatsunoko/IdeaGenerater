class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
