class Relation < ApplicationRecord
  belongs_to :article, foreign_key: 'article_id'
  belongs_to :categorie, foreign_key: 'category_id'
  validates :article_id, presence: true
  validates :category_id, presence: true
end
