class Comment < ActiveRecord::Base
  belongs_to :username
  belongs_to :question
end
