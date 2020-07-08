class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, :body, :image, :author_id, presence: true
end
