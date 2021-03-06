class BucketlistItemsController < ApplicationController
  before_action :require_user
  before_action :find_bucket_list

  def index
  end

  def new
    @bucketlist_item = @bucket_list.bucketlist_items.new
  end

  def create
    @bucketlist_item = @bucket_list.bucketlist_items.new(bucketlist_item_params)
    if @bucketlist_item.save
      flash[:success] = "Added bucket list item."
      redirect_to bucket_list_bucketlist_items_path
    else
      flash[:error] = "There was a problem adding that bucket list item."
      render action: :new
    end
  end

  def edit
    @bucketlist_item = @bucket_list.bucketlist_items.find(params[:id])
  end

  def update
    @bucketlist_item = @bucket_list.bucketlist_items.find(params[:id])
    if @bucketlist_item.update_attributes(bucketlist_item_params)
      flash[:success] = "Updated bucket list item."
      redirect_to bucket_list_bucketlist_items_path
    else
      flash[:error] = "There was a problem updating that list item."
      render action: :edit
    end
  end

  def destroy
    @bucketlist_item = @bucket_list.bucketlist_items.find(params[:id])
    if @bucketlist_item.destroy
      flash[:success] = "Bucket list item has been deleted."
    else
      flash[:error] = "Bucket list item could not be deleted."
    end
    redirect_to bucket_list_bucketlist_items_path
  end

  def complete
    @bucketlist_item = @bucket_list.bucketlist_items.find(params[:id])
    @bucketlist_item.update_attribute(:completed_at, Time.now)
    redirect_to bucket_list_bucketlist_items_path, notice: "List item marked complete."
  end

  # get bucket list id every time a url is generated by Rails app
  def url_options
    { bucket_list_id: params[:bucket_list_id] }.merge(super)
  end

  private
  def find_bucket_list
    @bucket_list = current_user.bucket_lists.find(params[:bucket_list_id])
  end

  def bucketlist_item_params
    params[:bucketlist_item].permit(:content)
  end
end
