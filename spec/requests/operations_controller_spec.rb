require 'rails_helper'

RSpec.describe 'MovementsControllers', type: :request do
  before do
    @user = User.find_or_create_by(name: 'John', email: 'johndoe@example.com') do |user|
      user.password = '123456'
    end
    @group = Group.find_or_create_by(user: @user, name: 'Microverse') do |group|
      group.icon = 'microverse.png'
    end
    sign_in @user
  end

  describe 'GET #new' do
    it 'renders the add a new movement page' do
      get new_group_operation_path(@group)
      expect(response).to have_http_status(:success)
    end
  end
end
