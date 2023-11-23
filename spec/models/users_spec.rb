require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Javier', email: 'email@gmail.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'email@gmail.com', password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without an email' do
    user = User.new(name: 'Javier', password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is not valid without a unique email' do
    User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    user = User.new(name: 'Another Javier', email: 'email@gmail.com', password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'has many groups' do
    user = User.new(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group1 = Group.create(name: 'Group 1', icon: 'icon1.png', user:)
    group2 = Group.create(name: 'Group 2', icon: 'icon2.png', user:)
    expect(user.groups).to include(group1, group2)
  end
end
