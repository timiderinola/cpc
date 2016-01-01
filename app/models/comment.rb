class Comment < ActiveRecord::Base
  validates :author,  presence: true
  validates :content,  presence: true

  belongs_to :message
end
