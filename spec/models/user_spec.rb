require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it{ is_expected.to have_many(:addresses) }
    it{ is_expected.to have_one(:contact_detail) }
  end

  describe 'validations' do
    it { should validate_presence_of(:addresses) }
    it { should validate_presence_of(:contact_detail) }
  end

  it { should accept_nested_attributes_for(:addresses), allow_destroy: true }
  it { should accept_nested_attributes_for(:contact_detail), allow_destroy: true }
end
