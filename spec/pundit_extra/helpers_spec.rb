require 'spec_helper'

describe "helpers" do

  describe "in views" do

    it "should check permissions with can? and cannot?" do
      sign_in_as_user
      visit '/tasks/0'
      expect(page.status_code).to be 200
      expect(page).to have_content "You can update this task"
      expect(page).to_not have_content "You can destroy this task"
      expect(page).to have_content "You cannot delegate this task"
    end

  end

  describe "in controllers" do

    it "should return true from the can? view helper" do
      sign_in_as_admin
      visit '/whoami'
      expect(page).to have_content "you are a ninja"
    end

    it "should return false from the can? view helper" do
      sign_in_as_user
      visit '/whoami'
      expect(page).to have_content "you are a user"
    end
      
  end

end
