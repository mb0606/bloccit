class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body
  

  validates :body, length: { minimum: 10 }, presence: true
  validates :post, presence: true
  validates :user, presence: true

  after_create :send_favorite_emails
  #after_create is a call back that loads when you .save

  private

  def send_favorite_emails
    self.post.favorites.each do |favorite|
        #comment instance that belongs to that post which has been favorited by
        #a list of users. Favorite table has 2 columns post_id,user_id
      FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
                ## new_comment is defined in mailers/favorites_mailer.rb
                #every time is is called it passes the argments and mails
    end
  end

end  