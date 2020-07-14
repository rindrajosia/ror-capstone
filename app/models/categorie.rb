class Categorie < ApplicationRecord
  has_many :tags, foreign_key: 'category_id'
  has_many :articles, through: :tags, source: 'article'

  def self.priority_ordered
    Categorie.order(priority: :desc).includes(:articles).limit(4)
  end

  def self.list(id)
    Categorie.find(id).articles.order(created_at: :desc).includes(:author)
  end
end
