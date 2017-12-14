class Question < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :body,  length: { maximum: 500 }, presence: true
    validates :title,  length: { maximum: 150 }, presence: true
end
