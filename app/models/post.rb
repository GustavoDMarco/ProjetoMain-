class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(created_at: :desc) }
  has_many :post_tags
  has_many :tags, through: :post_tags


 
end
