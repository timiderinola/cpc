class Video < ActiveRecord::Base
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YT_LINK_FORMAT


  before_create -> do
    uid = link.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]

    if self.uid.to_s.length != 11
      self.errors.add(:link, 'is invalid.')
      false
    elsif Video.where(uid: self.uid).any?
      self.errors.add(:link, 'is not unique.')
      false
    else
      get_additional_info
    end
  end

  private

  def get_additional_info
    begin
      video = Yt::Video.new url: link
      self.uid = video.id
      self.title = video.title
      self.likes = video.like_count
      self.dislikes = video.dislike_count
      self.published_at = video.published_at
    rescue
      self.title = ''
    end
  end
end