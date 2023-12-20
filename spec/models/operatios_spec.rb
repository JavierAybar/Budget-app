require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'is not valid without a user' do
    group = Group.create(name: 'Example Group', icon: 'example.png')
    operation = Operation.new(name: 'Example Operation', amount: 100, groups: [group])
    expect(operation).not_to be_valid
    expect(operation.errors[:user]).to include('must exist')
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.create(user:, name: 'Example Group', icon: 'example.png')
    operation = Operation.new(user:, amount: 100, groups: [group])
    expect(operation).not_to be_valid
    expect(operation.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without an amount' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.create(user:, name: 'Example Group', icon: 'example.png')
    operation = Operation.new(user:, name: 'Example Operation', groups: [group])
    expect(operation).not_to be_valid
    expect(operation.errors[:amount]).to include("can't be blank")
  end

  it 'is not valid without a group' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    operation = Operation.new(user:, name: 'Example Operation', amount: 100)
    expect(operation).not_to be_valid
    expect(operation.errors[:group_id]).to include("can't be blank")
  end

  it 'has a user associated' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.create(user:, name: 'Example Group', icon: 'example.png')
    operation = Operation.new(user:, name: 'Example Operation', amount: 100, groups: [group])
    expect(operation.user).to eq(user)
  end

  it 'has a group associated' do
    user = User.create(name: 'Javier', email: 'email@gmail.com', password: 'password')
    group = Group.create(user:, name: 'Example Group', icon: 'example.png')
    operation = Operation.new(user:, name: 'Example Operation', amount: 100, groups: [group])
    expect(operation.groups).to include(group)
  end
end
