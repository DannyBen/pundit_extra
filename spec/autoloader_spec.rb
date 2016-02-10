require 'spec_helper'

describe "resource autoloader" do
  describe "on #index" do
    it "should load policy scope" do
      sign_in_as_admin
      visit '/'
      expect(page).to have_content "Task Count: 3"
    end

    it "should load restricted policy scope" do
      sign_in_as_user
      visit '/'
      expect(page).to have_content "Task Count: 1"
    end
  end

  describe "on #new" do
    it "should create a new model instance" do
      sign_in_as_user
      visit '/tasks/new'
      expect(page).to have_content "new task is ready with class Task"
    end    
  end

  describe "on #create" do
    it "should assign model params" do
      sign_in_as_user
      visit '/tasks/create?subject=yes+we+can&done=false'
      expect(page).to have_content "yes we can"
    end    
  end

end