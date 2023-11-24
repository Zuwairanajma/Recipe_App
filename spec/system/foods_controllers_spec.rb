require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now, confirmation_sent_at: Time.now
    )
    @user.save!
    sign_in @user

    @food = Food.create(
      name: 'Tufo',
      measurement_unit: 'KG',
      price: 20.00,
      quantity: 4,
      # user_id: @user.id
      user: @user
    )
    # sign_in @user
    # puts "User signed in: #{user_signed_in?}"
  end

  describe '#index' do
    before(:each) do
      visit foods_path
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end

    it 'on clicking on a food, should redirect to that food show page' do
      click_on @food.name
      expect(page).to have_current_path(food_path(@food))
    end
  end

  describe '#show' do
    before(:each) do
      visit food_path(@food)
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end
  end

  describe '#destroy' do
    it 'should delete the food' do
      visit foods_path

      expect(page).to have_content(@food.name)

      click_on 'Delete'

      expect(page).to have_current_path(foods_path)
      expect(page).not_to have_content(@food.name)
    end
  end
end
