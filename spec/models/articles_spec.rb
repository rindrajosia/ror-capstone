require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#title' do
    it 'doesnt take an article without the title' do
      article = Article.new
      article.title = nil
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")

      article.title = 'test'
      article.valid?
      expect(article.errors[:title]).to_not include("can't be blank")
    end

    it 'doesnt take an article without a body' do
      article = Article.new
      article.text = nil
      article.valid?
      expect(article.errors[:text]).to include("can't be blank")

      article.text = 'test'
      article.valid?
      expect(article.errors[:text]).to_not include("can't be blank")
    end

    it 'doesnt take an article without an image' do
      article = Article.new
      article.image = nil
      article.valid?
      expect(article.errors[:image]).to include("can't be blank")
    end
  end
end
