class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :clickbait



#You can pass more than one symbol for each class method and the respective validations will be run in the same order as they were registered.

#The valid? method will verify that the errors collection is empty, so your custom validation methods should add errors to it when you wish validation to fail:


  def clickbait
    bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    #check inclusion
    if title && !bait.any? { |bait|  title.include?(bait) }
      #add errors 'if .. &&..'
      errors.add(:title, "take me down a click-hole...")
    end
  end

end
