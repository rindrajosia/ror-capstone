class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  has_many :votes
  has_many :tags, foreign_key: 'article_id'
  has_many :categories, through: :tags, source: 'categorie'
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
  validates :text, presence: true, length: { minimum: 200 }
  validates :image, presence: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  def self.search(search)
    where('lower(title) LIKE ?', "%#{search}%")
  end

  def number_of_votes
    votes.count
  end
end
