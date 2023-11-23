require 'rails_helper'

RSpec.describe 'GroupsController', type: :request do
  describe 'Get/ #index' do
    before(:all) { @group = FactoryBot.create(:group) }
    before(:each) { sign_in @group.user }

    it 'response status was correct' do
      get groups_path
      expect(response).to have_http_status(:success)
    end

    it 'correct template was rendered' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get groups_path
      expect(response.body).to include(@group.name)
    end
  end
end
