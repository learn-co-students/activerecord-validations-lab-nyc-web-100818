class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size" }
  validate :not_click_bait
    # validate
    # Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false

  def not_click_bait
    valid = nil
    if title
      phrase_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      phrase_array.each {|phrase| valid = true if title.include?(phrase) }
      if valid == true
        return valid
      else
        errors[:title] << 'Title is not sufficiently clickbaity'
      end
    else
      errors[:title] << 'Title Must be present'
    end
  end


end
