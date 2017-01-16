class Post < ApplicationRecord
  validate :decription_is_valid

  private

  def decription_is_valid
    if !description.nil?
      if (description.length == 0)
        errors.add(:description, "Message cannot be empty.")
      elsif (description.length > 150)
        errors.add(:description, "Message cannot be over 150 characters.")
      end
    end
  end
end
