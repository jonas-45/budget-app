require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Jonas', email: 'jonas@gmail.com', password: 'jonas1234')
  end

  before { subject.save }

  it 'should have a user name' do
    expect(subject.name).to eql 'Jonas'
  end

  it 'should have an email' do
    expect(subject.email).to be_present
  end

  it 'should have a password' do
    expect(subject.password).to eql 'jonas1234'
  end
end
