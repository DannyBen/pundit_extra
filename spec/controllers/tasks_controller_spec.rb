require 'spec_helper'

describe TasksController do
  describe '#index' do
    it "runs successfully" do
      get :index
      expect(response).to be_success
    end

    it "allows unrestricted access" do
      sign_in_as_admin
      get :index
      task_count = assigns(:tasks).size
      expect(task_count).to be >= 2
    end

    it "restricts access" do
      sign_in_as_user
      get :index
      task_count = assigns(:tasks).size
      expect(task_count).to be == 1
    end
  end

  describe '#show' do
    it "allows access" do
      sign_in_as_admin
      get :show, id: 1
      expect(response).to be_success
      task = assigns :task
      expect(task.subject).to eq "Task 1"
    end

    it "restricts access" do
      sign_in_as_user
      get :show, id: 1
      expect(response).to redirect_to :root
    end
  end

  describe '#complete' do
    it "raises an AuthorizationNotPerformed exception" do
      expect{get :complete, id: 1}.to raise_error Pundit::AuthorizationNotPerformedError
    end
  end

  describe '#purge' do
    it "allows access without authorization" do
      get :purge
      expect(response).to be_success
    end
  end

  describe '#whoami' do
    it "returns false from the can? view helper" do
      sign_in_as_user
      get :whoami
      expect(response.body).to eq "you are a user"      
    end
      
    it "returns true from the can? view helper" do
      sign_in_as_admin
      get :whoami
      expect(response.body).to eq "you are a ninja"
    end

  end
end