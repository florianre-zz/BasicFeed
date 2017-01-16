require 'rails_helper'

RSpec.describe "the feed interface" do

	it 'welcomes the user' do
    visit '/'
    expect(page).to have_content('Simple Feed')
    expect(page).to have_content('Description')
    expect(page).to have_no_content('Hello World!')
  end

  it 'displays post correctly' do
    visit '/'
    fill_in 'Description', with: 'Hello World!'
    click_button 'Post'
    expect(page).to have_css('div#row_1')
    expect(find("div#row_1")).to have_content('Hello World!')
    expect(find("div#row_1")).to have_button('Delete Post')
    click_button 'Delete Post'
    expect(page).to have_no_css('div#row_1')
  end

end
