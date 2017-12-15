class Comment < ActiveRecord::Base
    
    validates :body, :user, presence: true, length: { maximum: 500}
    
    belongs_to :question
    belongs_to :user
end
