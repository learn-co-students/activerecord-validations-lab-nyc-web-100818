require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  # validates :title, inclusion: { in: %w("Won't Believe" "Secret" "Top [number]" "Guess")}
  # validate :non_clickbait
  #
  # def non_clickbait
  #   if !self.title.include?("Won't Believe")
  #     # binding.pry
  #     errors.add(:title, "has to be click-baity")
  #   elsif !self.title.include?("Secret")
  #     errors.add(:title, "has to be click-baity")
  #   elsif !self.title.include?("Top [number]")
  #     errors.add(:title, "has to be click-baity")
  #   elsif !self.title.include?("Guess")
  #     errors.add(:title, "has to be click-baity")
  #   else
  #     self.save
  #   end
  # end
end
