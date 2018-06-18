require 'rails_helper'

RSpec.describe "Bands", :type => :model do
  let(:valid_attributes) do
    {
      name: "SkullHead"
    }
  end

  it "has a name" do
    band = Band.new(name: "SkullHead")
    expect(band.name).to eq("SkullHead")
  end

  it "name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:name)
    band = Band.new(attributes)
    expect(band).not_to be_valid
  end

  it "has many bookings" do
    band = Band.new(valid_attributes)
    expect(band).to respond_to(:bookings)
    expect(band.doses.count).to eq(0)
  end

  it "should destroy child doses when destroying self" do
    Band = Band.create!(valid_attributes)
    ingredient = Ingredient.create!(name: "ice")
    band.doses.create(ingredient: ingredient, description: "A lot!")
    expect { Band.destroy }.to change { Dose.count }.from(1).to(0)
  end

  it "has many ingredients" do
    Band = band.create!(valid_attributes)
    expect(Band).to respond_to(:ingredients)
    expect(band.ingredients.count).to eq(0)

    ingredient = Ingredient.create!(name: "ice")
    band.doses.create(ingredient: ingredient, description: "A lot!")
    expect(band.ingredients.count).to eq(1)
  end
end
