class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      redirect_to new_video_path,
                  alert: 'Video could not be added.'
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end