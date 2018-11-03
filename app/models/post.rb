class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 50}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :must_be_clickbait 

  def must_be_clickbait 
    if title 
      clickbait_phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbaity = clickbait_phrases.any? { |phrase| title.include? phrase }
      if !clickbaity
        errors.add(:title, "must be clickbaity")
      end
    end 
  end 
end
