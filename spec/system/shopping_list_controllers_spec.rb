require 'rails_helper'

RSpec.describe 'General Shopping Lists', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now,
      confirmation_sent_at: Time.now
    )
    @user.save!
    sign_in @user

    @food = Food.create(
      name: 'Briyani',
      measurement_unit: 'kg',
      price: 10,
      quantity: 5,
      user: @user
      # user_id: @user.id
    )
  end

  it 'displays the signed in user' do
    visit '/shopping_list'
    expect(page).to have_text(@user.name)
  end

  it 'displays Amount of food items to buy' do
    visit '/shopping_list'
    expect(page).to have_text('Amount of food items to buy')
  end

  it 'displays table columns' do
    visit '/shopping_list'
    expect(page).to have_text('Food')
    expect(page).to have_text('Quantity')
    expect(page).to have_text('Price')
  end
end
