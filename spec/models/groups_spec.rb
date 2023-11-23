require 'rails_helper'

RSpec.describe Group, type: :model do

  it 'is valid with valid attributes' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.new(user: user, name: 'Example', icon: 'example.png')
    expect(group).to be_valid
  end

  it 'is not valid without a user' do
    group = Group.new(name: 'Example', icon: 'example.png')
    expect(group).not_to be_valid
    expect(group.errors[:user]).to include("must exist")
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.new(user: user, icon: 'example.png')
    expect(group).not_to be_valid
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without an icon' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.new(user: user, name: 'Example')
    expect(group).not_to be_valid
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'has a user associated' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.new(user: user, name: 'Example', icon: 'example.png')
    expect(group.user).to eq(user)
  end
end