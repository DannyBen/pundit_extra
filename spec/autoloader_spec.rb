require 'spec_helper'

describe "resource autoloader" do
  describe "on #index" do
    it "loads policy scope" do
      sign_in_as_admin
      visit '/'
      expect(page).to have_content "Task Count: 3"
    end

    it "loads restricted policy scope" do
      sign_in_as_user
      visit '/'
      expect(page).to have_content "Task Count: 1"
    end
  end

end