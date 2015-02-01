class ItemsController < ApplicationController
  respond_to :html, :js
  def new
    @item = Item.new
  end
  
  
  
  def create
    @list = List.find(params[:list_id])
    @items = @list.items
    @item = current_user.items.new(params.require(:item).permit(:name))
    @item.list = @list
    if @item.save
      flash[:notice] = "New task added"
    else
      flash[:error] = "Error, please try again"
    end
    respond_with @item do |format|
      format.html { redirect_to @item.list }
    end
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Task successfully deleted"
    else
      flash[:notice] = "Please try again"
    end
    
    respond_with @item do |format|
      format.html { redirect_to @item.list }
    end
  end
end
