class ListsController < ApplicationController
  def index
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end
  
  def create
    @list = List.new(params.require(:list).permit(:title))
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end
  

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params.require(:list).permit(:title))
      redirect_to @list
    else
      render :edit
    end
  end
  
end
