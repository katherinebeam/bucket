class BucketlistItemsController < ApplicationController
  def index
    @bucket_list = BucketList.find(params[:bucket_list_id])
  end

  def new
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @bucketlist_item = @bucket_list.bucketlist_items.new
  end

  def create
    @bucket_list = BucketList.find(params[:bucket_list_id])
    @bucketlist_item = @bucket_list.bucketlist_items.new(bucketlist_item_params)
    if @bucketlist_item.save
      flash[:success] = "Added bucket list item."
      redirect_to bucket_list_bucketlist_items_path
    else
      flash[:error] = "There was a problem adding that bucket list item."
      render action: :new
    end
  end

  private
  def bucketlist_item_params
    params[:bucketlist_item].permit(:content)
  end
end
