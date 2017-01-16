require 'rails_helper'

RSpec.describe "the feed interface" do
	it 'welcomes the user' do
    visit '/'
    expect(page).to have_content('Basic Feed')
  end
end
