class BucketListsController < ApplicationController
  before_action :set_bucket_list, only: [:show, :edit, :update, :destroy]

  # GET /bucket_lists
  # GET /bucket_lists.json
  def index
    @bucket_lists = BucketList.all
  end

  # GET /bucket_lists/1
  # GET /bucket_lists/1.json
  def show
  end

  # GET /bucket_lists/new
  def new
    @bucket_list = BucketList.new
  end

  # GET /bucket_lists/1/edit
  def edit
  end

  # POST /bucket_lists
  # POST /bucket_lists.json
  def create
    @bucket_list = BucketList.new(bucket_list_params)

    respond_to do |format|
      if @bucket_list.save
        format.html { redirect_to @bucket_list, notice: 'Bucket list was successfully created.' }
        format.json { render :show, status: :created, location: @bucket_list }
      else
        format.html { render :new }
        format.json { render json: @bucket_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bucket_lists/1
  # PATCH/PUT /bucket_lists/1.json
  def update
    respond_to do |format|
      if @bucket_list.update(bucket_list_params)
        format.html { redirect_to @bucket_list, notice: 'Bucket list was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucket_list }
      else
        format.html { render :edit }
        format.json { render json: @bucket_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bucket_lists/1
  # DELETE /bucket_lists/1.json
  def destroy
    @bucket_list.destroy
    respond_to do |format|
      format.html { redirect_to bucket_lists_url, notice: 'Bucket list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket_list
      @bucket_list = BucketList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_list_params
      params.require(:bucket_list).permit(:title, :description)
    end
end
