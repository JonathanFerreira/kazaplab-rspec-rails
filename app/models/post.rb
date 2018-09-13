class Post < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { maximum: 100 }
end
