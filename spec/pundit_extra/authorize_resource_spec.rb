require 'spec_helper'

describe "#authorize_resource" do

  describe "with an action that was authorized" do

    it "should allow access to admin" do
      sign_in_as_admin
      visit '/tasks/1'
      expect(page).to have_content "Task: Task 1"
    end

    it "should restrict access to user" do
      sign_in_as_user
      visit '/tasks/1'
      expect(current_path).to eq '/'
      expect(page).to have_content "not authorized"
    end

  end

  describe "with an action that was not authorized" do

    it "should raise AuthorizationNotPerformedError" do
      expect {visit '/tasks/purge'}.to raise_error Pundit::AuthorizationNotPerformedError
    end

  end

  describe "with a public action" do
    
    it "should allow access" do
      visit "/status"
      expect(page).to have_content "the system is up, this is public knowledge"
    end

  end

end