require 'rails_helper'

RSpec.describe 'Create new group', type: :feature do
  let(:user) do
    User.create(name: 'Javier', email: 'example@example.com', password: 'password')
  end

  before do
    sign_in user
  end

  it 'create new group' do
    visit new_group_path
    fill_in 'group[name]', with: 'New Group'
    fill_in 'group[icon]', with: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    click_button 'Create category'

    expect(page).to have_content('New Group')
  end

  it 'throw error message when trying to create without values' do
    visit new_group_path
    click_button 'Create category'
    expect(page).to have_content('2 errors prohibited this group from being saved:')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Icon can\'t be blank')
  end
end
