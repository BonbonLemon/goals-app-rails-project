require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "test_username"
      fill_in 'password', with: "password"
      click_on "Submit"
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "test_username"
    end

  end

end

feature "logging in" do
  let(:jeff) { User.new(username: "jeff", password: "jeffjeff") }

  it "shows username on the homepage after login" do
    jeff.save
    visit new_session_url
    fill_in 'username', with: jeff.username
    fill_in 'password', with: jeff.password
    click_on "Sign In!!!!"

    expect(page).to have_content jeff.username
  end

end

feature "logging out" do
  let(:jeff) { User.new(username: "jeff", password: "jeffjeff") }

  it "begins with logged out state" do
    visit new_session_url

    expect(page).not_to have_content "Logout"
  end

  it "doesn't show username on the homepage after logout" do
    jeff.save
    visit new_session_url
    fill_in 'username', with: jeff.username
    fill_in 'password', with: jeff.password
    click_on "Sign In!!!!"
    click_on "Logout"

    expect(page).not_to have_content jeff.username
  end

end
