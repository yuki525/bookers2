class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end





  def self.looks(searches, words)
                if searches == "forward_match"
                        @book = Book.where("title LIKE?","#{words}%")
                elsif searches == "backward_match"
                         @book = Book.where("title LIKE?","%#{words}")
                elsif searches == "perfect_match"
                         @book = Book.where("title LIKE?", "#{words}")
                elsif searches == "partial_match"
                         @book = Book.where("title LIKE?","%#{words}%")
                else
                         @book = Book.all
                end
  end


end