class ArchivesController < ApplicationController
  #before_action :set_archive, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_archive, only: [:destroy, :show]
  before_action :set_product, only: [:destroy]
  #before_action :authenticate_ower!, only:  [:show, :edit, :update, :destroy]
  before_action :authenticate_ower!, except: :show

  # GET /archives
  # GET /archives.json
  def index
    @archives = Archive.all
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    if @archive.product.user == current_user
      send_file  @archive.archive.path 
    else
      redirect_to @archive.product, notice: 'Not'
    end
  end

  # GET /archives/new
  def new
    @archive = Archive.new
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = Archive.new(archive_params)
    if @archive.save
      redirect_to @archive.product, notice: "Archive have save"
    else
      redirect_to @archive, notice: "Archive not save"
    end
  end

  # PATCH/PUT /archives/1
  # PATCH/PUT /archives/1.json
  def update
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to @archive, notice: 'Archive was successfully updated.' }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to @archive.product, notice: 'Archive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    def set_product
      @product = @archive.product
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def archive_params
      #params.fetch(:archive, {:archive, :product_id})
      params.require(:archive).permit(:archive, :product_id)
    end

    def authenticate_ower!
      if params.has_key? :archive
        @product = Product.find(params[:archive][:product_id])
      end
        
      if @product.nil? && @product.user != current_user
        redirect_to root_path, notice: 'Not have edit product'
        return
      end
    end

end
