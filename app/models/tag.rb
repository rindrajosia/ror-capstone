class Tag < ApplicationRecord
  belongs_to :article, foreign_key: 'article_id'
  belongs_to :categorie, foreign_key: 'category_id'
end
