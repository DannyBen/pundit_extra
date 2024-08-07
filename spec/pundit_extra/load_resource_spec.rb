require 'spec_helper'

describe '#load_resource' do
  describe 'on #index' do
    it 'loads policy scope' do
      sign_in_as_admin
      visit '/'
      expect(page).to have_content 'Task Count: 3'
    end

    it 'loads restricted policy scope' do
      sign_in_as_user
      visit '/'
      expect(page).to have_content 'Task Count: 1'
    end
  end

  describe 'on #new' do
    it 'creates a new model instance' do
      sign_in_as_user
      visit '/tasks/new'
      expect(page).to have_content 'new task is ready with class Task'
    end
  end

  describe 'on #create' do
    it 'assigns model params' do
      sign_in_as_user
      visit '/tasks/create?subject=yes+we+can&done=false'
      expect(page).to have_content 'yes we can'
    end

    context 'with permitted_attributes' do
      it 'assigns restricted model params' do
        sign_in_as_user
        visit '/books/create?book[author]=Author&book[title]=Title'
        expect(page).to have_content '{"author"=>"Author"}'
      end

      it 'assigns liberal model params' do
        sign_in_as_admin
        visit '/books/create?book[author]=Author&book[title]=Title&not_allowed=NotAllowed'
        expect(page).to have_content '{"title"=>"Title", "author"=>"Author"}'
      end
    end
  end

  describe 'on #update' do
    it 'assigns model params for specific action' do
      sign_in_as_user
      visit '/books/1/update?book[price]=123&not_allowed=NotAllowed'
      expect(page).to have_content '{"price"=>"123"}'
    end

    it 'uses action-specific params' do
      sign_in_as_user
      visit '/tasks/1/update?done=true'
      expect(page).to have_content '{:done=>"true"}'
    end
  end

  describe 'on #show' do
    it 'assigns model based on params[:id]' do
      sign_in_as_admin
      visit '/tasks/1'
      expect(page).to have_content 'Task: Task 1'
    end
  end
end
