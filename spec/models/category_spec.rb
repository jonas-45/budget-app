require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Jonas', email: 'jonas@gmail.com', password: 'jonas1234')
    @category = Category.create(name: 'Home', user_id: @user.id)
  end

  describe 'Validation' do
    it 'should validate the presence of a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'should validate the length of the name' do
      @category.name = 'a' * 51
      expect(@category).to_not be_valid
    end
  end

  describe 'Association' do
    it 'should belong to a user' do
      expect(@category.user_id).to eq(@user.id)
    end

    it 'should have many expenses' do
      t = Category.reflect_on_association(:expenses)
      expect(t.macro).to eq(:has_many)
    end
  end
end
