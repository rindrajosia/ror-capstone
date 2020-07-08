class Categorie < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
end
