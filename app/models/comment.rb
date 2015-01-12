class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :reading

  validates :content, presence: true
  validates :content, length: { minimum: 3 }
end
