class VideosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @videos = Video.order('created_at DESC')
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