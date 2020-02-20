class ItemsController < ApplicationController

  def show
    @item = Item.find(4)
    @item_image = @item.item_images[0]
    @item_images_sub1 = @item.item_images
  end

  def new
    @item = Item.new
    @item.item_images.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
    @item = Item.fnd(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_id , :shipping_fee_who_id, :prefecture_id, :shipping_days_id, item_images_attributes: [:url] ).merge(user_id: current_user.id)
  end
end
