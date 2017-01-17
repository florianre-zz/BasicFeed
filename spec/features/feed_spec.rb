require 'rails_helper'

RSpec.describe "the feed interface" do

  it 'displays post' do
    visit '/'

    fill_in 'Description', with: 'Hello World!'
    expect(page).to have_no_css('div#row_1')
    click_button 'Post'
    expect(page).to have_css('div#row_1')
    expect(find("div#row_1")).to have_content('Hello World!')
    expect(find("div#row_1")).to have_button('Delete Post')
    expect(find("div#row_1")).to have_content('less than a minute ago')
  end

  it 'removes post' do
    visit '/'

    fill_in 'Description', with: 'Hello World!'
    click_button 'Post'
    expect(page).to have_css('div#row_1')

    click_button 'Delete Post'
    expect(page).to have_no_css('div#row_1')
  end

  it 'displays :success flash messages' do
    visit '/'

    fill_in 'Description', with: 'Hello World!'
    expect(page).to have_no_content('Success!')
    click_button 'Post'
    expect(page).to have_content('Success!')

    expect(page).to have_no_content('Successfully deleted post.')
    click_button 'Delete Post'
    expect(page).to have_content('Successfully deleted post.')
  end

  it 'diaplays empty post message flash message' do
    visit '/'

    expect(page).to have_no_content('Empty message not allowed.')
    click_button 'Post'
    expect(page).to have_content('Empty message not allowed.')
    expect(page).to have_no_css('div#row_1')

    fill_in 'Description', with: "c"
    click_button 'Post'
    expect(page).to have_css('div#row_1')
  end

  it 'displays flash message when post message over 150 characters' do
    max = 150
    visit '/'

    str = "0" * max
    fill_in 'Description', with: str
    click_button 'Post'
    expect(page).to have_css('div#row_1')

    str += "0"
    fill_in 'Description', with: str
    click_button 'Post'
    expect(page).to have_content("#{max} characters is the maximum allowed.")
    expect(page).to have_no_css('div#row_2')
  end

end
