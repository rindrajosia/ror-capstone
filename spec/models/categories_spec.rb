require 'rails_helper'

RSpec.describe Categorie, type: :model do
  it 'Create categorie' do
    Categorie.create(name: 'Tv', priority: 1)
    cat = Categorie.all.first
    expect(cat.name).to eq 'Tv'
  end
end
