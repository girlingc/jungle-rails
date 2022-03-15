require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User passwords match' do
    user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
    user.valid?
    it 'Userpassword match' do
      expect(user.errors[:password_confirmation]).not_to be_present
    end
  end

  context "User password don't match" do
    user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'tatteredking')
    user.valid?
    it "User password don't match" do
      expect(user.errors[:password_confirmation]).to be_present
    end
  end

  it 'User email must be unique' do
    user = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
    user.save

    u = User.new(email: 'cassilda@carcosa.com', password: 'hyades', password_confirmation: 'hyades')
    u.save

    expect(u.errors[:email].first).to eq('has already been taken')
  end

  it 'password length less than 5 characters is invalid' do
    user = User.new(email: 'cassilda@carcosa.com', password: 'king')

    result = user.save

    expect(result).to be(false)
  end

  it 'password length must be at-least 5 characters' do
    user = User.new(email: 'cassilda@carcosa.com', password: 'hyades')

    result = user.save

    expect(result).to be(true)
  end
end
