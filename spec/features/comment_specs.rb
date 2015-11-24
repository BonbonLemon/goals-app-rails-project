require 'spec_helper'
require 'rails_helper'

describe "goal comments" do
  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:goal)
  end
  feature "creating goal comments" do
    it "shows a comment on a goal page" do
      gc = FactoryGirl.create(:goal_comment)
      visit goal_path(gc.goal_id)
      expect(page).to have_content gc.body
    end

    it "has a form that creates a comment" do
      gc = FactoryGirl.build(:goal_comment)
      visit goal_path(gc.goal_id)
      expect(page).to have_content "Leave a comment"
    end
  end

  # feature "deleting comments" do
  #   it "deletes a comment" do
  #     gc = FactoryGirl.create(:goal_comment)
  #     body = gc.body
  #     visit goal_path(gc.goal_id)
  #     save_and_open_page
  #     click_button "Delete"
  #     expect(page).not_to have_content body
  #   end
  # end
end

describe "user comments" do
  before(:each) do
    FactoryGirl.create(:user)
  end
  feature "creating goal comments" do
    it "registers a comment" do
      uc = FactoryGirl.create(:user_comment)
      visit user_path(uc.user_id)
      expect(page).to have_content uc.body
    end

    it "has a form to create a comment" do
      uc = FactoryGirl.build(:user_comment)
      visit user_path(uc.user_id)
      expect(page).to have_content "Leave a comment"
    end
  end

  # feature "deleting comments" do
  #   it "deletes a comment"
  # end
end
