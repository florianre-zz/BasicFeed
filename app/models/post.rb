class Post < ApplicationRecord
  validate :decription_is_valid

  private

  def decription_is_valid
    if !description.nil?
      if (description.length == 0)
        flash[:error] = "Cannot publish empty post."
      # elsif condition
      end
    end
  end
end
