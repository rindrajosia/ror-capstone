require 'rails_helper'
RSpec.describe Relation, type: :model do
  describe '#user_id' do
    it 'doesnt take Relation without the article_id' do
      relation = Relation.new
      relation.article_id = nil
      relation.valid?
      expect(relation.errors[:article_id]).to include("can't be blank")

      relation.article_id = 1
      relation.valid?
      expect(relation.errors[:article_id]).to_not include("can't be blank")
    end

    it 'doesnt take Relation without the category_id' do
      relation = Relation.new
      relation.category_id = nil
      relation.valid?
      expect(relation.errors[:category_id]).to include("can't be blank")

      relation.category_id = 1
      relation.valid?
      expect(relation.errors[:category_id]).to_not include("can't be blank")
    end
  end
end
