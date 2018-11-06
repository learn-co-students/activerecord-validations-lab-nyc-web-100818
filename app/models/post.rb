class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}

  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :not_click_bait
    
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
