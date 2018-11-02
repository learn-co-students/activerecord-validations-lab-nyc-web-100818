class ClickbaitValidator < ActiveModel::Validator
  def validate(post)
    # binding.pry
    if post.title
      unless post.title.split(" ").include?("Believe" || "Secret" || "Top" || "Guess")
        post.errors[:title] << 'Not clickbaity enough!'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, :in => %w(fiction non-fiction)
  validates_with ClickbaitValidator
end
