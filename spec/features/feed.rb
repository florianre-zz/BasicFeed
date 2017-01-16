require 'rails_helper'

describe "the feed interface" do
	it 'welcomes the user' do
    visit '/'
    page.should have_content('Basic Feed')
  end
end
