class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :clickbait, presence: true, clickbait: true

end


#You can pass more than one symbol for each class method and the respective validations will be run in the same order as they were registered.

#The valid? method will verify that the errors collection is empty, so your custom validation methods should add errors to it when you wish validation to fail:

class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    unless value = value.any? {|v| attribute.include? (v) }
      record.errors[attribute] << ("nobody puts clickbait in a corner")
    end
  end
end
