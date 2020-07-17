class Categorie < ApplicationRecord
  has_many :relations, foreign_key: 'category_id'
  has_many :articles, through: :relations, source: 'article'
  validates :name, presence: true
  validates :priority, presence: true

  def self.priority_ordered
    Categorie.ordered_priority.includes(:articles).limit(4)
  end

  def self.list(id)
    Categorie.find(id).articles.ordered_articles.includes(:author)
  end

  scope :ordered_priority, -> { order(priority: :desc) }
end
