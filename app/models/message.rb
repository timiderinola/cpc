class Message < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :preacher,  presence: true
  validates :content,  presence: true
  validates :bible_passage,  presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :comments
end
