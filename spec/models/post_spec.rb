require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'should validate presence of description attribute' do
    should validate_presence_of(:description).with_message("Empty message not allowed.")
  end

  it 'should have a maximum character length of 150 for description attribute' do
    max = 150
    should validate_length_of(:description).is_at_most(max).with_message("#{max} characters is the maximum allowed.")
  end

end
