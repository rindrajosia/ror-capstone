require 'rails_helper'

RSpec.describe Categorie, type: :model do
  it 'Create categorie' do
    Categorie.create(name: 'Tv', priority: 1)
    cat = Categorie.all.first
    expect(cat.name).to eq 'Tv'
  end

  it 'doesnt take categorie without the name' do
    cat = Categorie.new
    cat.name = nil
    cat.valid?
    expect(cat.errors[:name]).to include("can't be blank")

    cat.name = 'Test'
    cat.valid?
    expect(cat.errors[:name]).to_not include("can't be blank")
  end

  it 'doesnt take categorie without the priority' do
    cat = Categorie.new
    cat.priority = nil
    cat.valid?
    expect(cat.errors[:priority]).to include("can't be blank")

    cat.priority = 8
    cat.valid?
    expect(cat.errors[:priority]).to_not include("can't be blank")
  end
end
