require 'spec_helper'

describe 'rails test server' do
  it 'runs successfully' do
    visit '/'
    expect(page.status_code).to be 200
  end
end
