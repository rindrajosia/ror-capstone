require 'rails_helper'
RSpec.describe Vote, type: :model do
  describe '#user_id' do
    it 'doesnt take vote without the user_id' do
      vote = Vote.new
      vote.user_id = nil
      vote.valid?
      expect(vote.errors[:user_id]).to include("can't be blank")

      vote.user_id = 1
      vote.valid?
      expect(vote.errors[:user_id]).to_not include("can't be blank")
    end

    it 'doesnt take vote without the article_id' do
      vote = Vote.new
      vote.article_id = nil
      vote.valid?
      expect(vote.errors[:article_id]).to include("can't be blank")

      vote.article_id = 1
      vote.valid?
      expect(vote.errors[:article_id]).to_not include("can't be blank")
    end
  end
end
