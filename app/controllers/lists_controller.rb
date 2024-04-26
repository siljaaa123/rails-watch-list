class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def image
    @list = List.find(params[:id])

    # if @list.save
    #   redirect_to lists_path
    # else
    #   render :image, status: :unprocessable_entity
    # end
  end

  def update
    #  for the image to be uploaded to cloudinary
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :image, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :bookmarks, :movies, :image)
  end
end
