class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :article, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
