class Post < ApplicationRecord
  validates_presence_of :description, message: 'Empty message not allowed.'
  validates :description, length: { maximum: 150, too_long: '%{count} characters
   is the maximum allowed.' }
end
