class Categorie < ApplicationRecord
  has_many :tags, foreign_key: 'category_id'
  has_many :articles, through: :tags, source: 'article'

  def self.priority_ordered
    Categorie.ordered_priority.includes(:articles).limit(4)
  end

  def self.list(id)
    Categorie.find(id).articles.ordered_articles.includes(:author)
  end

  scope :ordered_priority, -> { order(priority: :desc) }
end
