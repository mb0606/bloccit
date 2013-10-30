class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body
  

  validates :body, length: { minimum: 10 }, presence: true
  validates :post, presence: true
  validates :user, presence: true
end  