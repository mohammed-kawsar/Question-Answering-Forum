class Comment < ActiveRecord::Base
    validates :body, :user, presence: true,
              length: {minimum: 1}
              

  
  belongs_to :question
  belongs_to :user
end
