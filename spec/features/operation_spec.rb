require 'rails_helper'

RSpec.describe 'Create operation', type: :feature do
  let(:user) { User.create(name: 'Javier', email: 'example@example.com', password: 'password', id: 1) }

  let(:group) { Group.create!(name: 'Group 2', icon: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', user_id: user.id) }

  before do
    sign_in user
  end

  it 'create new operation' do
    visit new_group_operation_path(group.id)
    fill_in 'operation[name]', with: 'Operation 1'
    fill_in 'operation[amount]', with: '3'
    select 'Group 2', from: 'operation[group_id]'
    click_button 'Save'

    expect(page).to have_content('Group 2')
  end

 it 're renders the page when trying to create new transaction without values' do
   visit new_group_operation_path(group.id)
   click_button 'Save'
   expect(page).to have_content('New transaction')
 end
end