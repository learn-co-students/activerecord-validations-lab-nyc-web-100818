class Post < ActiveRecord::Base
  def clickbait
    if title
      clickbait_phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbaity = clickbait_phrases.any? { |phrase| title.include? phrase }
      if !clickbaity
        errors.add(:title, "must be clickbaity")
      end
    end
  end
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait
end
