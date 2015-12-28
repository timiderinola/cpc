class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
    # @video = Video.first
    # @video_embed = %Q{<iframe height="226" width="100%"
    #               src="http://www.youtube.com/embed/#{@video.uid}?autoplay=0&controls=2&autohide=1"></iframe>}.html_safe
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to videos_path,
                  notice: 'Video added!'
    else
      render :new,
             alert: 'Error adding video!'
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end