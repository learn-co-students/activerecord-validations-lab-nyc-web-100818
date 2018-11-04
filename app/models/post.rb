class ClickbaitynessValidator < ActiveModel::Validator
  def validate(post)
    if post.title
      unless post.title.split(" ").include?("Believe" || "Secret" || "Top" || "Guess")
        post.errors[:title] << 'Needs to be more clickbaity bro!'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validates_with ClickbaitynessValidator
end
