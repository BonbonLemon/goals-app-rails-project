require 'spec_helper'
require 'rails_helper'
describe "goals" do

  let(:jeff) { User.new(username: "jeff", password: "jeffjeff") }

  before(:each) do
    jeff.save
    visit new_session_url
    fill_in 'username', with: jeff.username
    fill_in 'password', with: jeff.password
    click_on "Sign In!!!!"
  end

  feature "creating goals" do
    it "provides the user with a link to create a goal from the user page" do
      expect(page).to have_content "Set a New Goal"
      click_on "Set a New Goal"
      expect(page).to have_content "Set Goal"
    end

    it "shows the new goal on the user's page" do
      click_on "Set a New Goal"
      fill_in 'body', with:"fake goal"
      choose('private')
      click_button "Set Goal"
      expect(page).to have_content "fake goal"
    end
  end

  feature "displaying goals" do
    before(:each) do
      click_on "Set a New Goal"
      fill_in 'body', with:"private fake goal"
      choose('private')
      click_button "Set Goal"

      click_on "Set a New Goal"
      fill_in 'body', with:"public fake goal"
      choose('public')
      click_button "Set Goal"
    end

    it "displays all of the user's goals" do
      expect(page).to have_content "private fake goal"
      expect(page).to have_content "public fake goal"
    end

    it "can display a page for a singular goal" do
      click_on "private fake goal"

      expect(page).to have_content "private fake goal"
      expect(page).to have_content "Status"
    end
  end

  feature "editing goals" do
    before(:each) do
      click_on "Set a New Goal"
      fill_in 'body', with:"private fake goal"
      choose('private')
      click_button "Set Goal"
    end

    it "registers an edit" do
      click_on "Edit"
      fill_in 'body', with: "edited goal"
      click_button "Change Goal"

      expect(page).to have_content "edited goal"
    end
  end

  feature "deleting goals" do
    before(:each) do
      click_on "Set a New Goal"
      fill_in 'body', with:"private fake goal"
      choose('private')
      click_button "Set Goal"
    end

    it "eliminates the goal from a user's list of goals" do
      click_button "Delete"

      expect(page).not_to have_content "private fake goal"
    end
  end
end
