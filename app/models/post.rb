class Post < ActiveRecord::Base
  belongs_to :user
   has_many :comments, dependent: :destroy
   validates :title, presence: true,length: {minimum: 5}
   validates :text, presence: true,length: {minimum: 30}
end
