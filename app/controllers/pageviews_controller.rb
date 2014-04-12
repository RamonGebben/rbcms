class PageviewsController < ApplicationController
  before_action :set_pageview, only: [:show, :edit, :update, :destroy]
  before_filter :logged_in?

  # GET /pageviews
  # GET /pageviews.json
  def index
    @pageviews = Pageview.all
  end

  # GET /pageviews/1
  # GET /pageviews/1.json
  def show
  end

  # GET /pageviews/new
  def new
    @pageview = Pageview.new
  end

  # GET /pageviews/1/edit
  def edit
  end

  # POST /pageviews
  # POST /pageviews.json
  def create
    @pageview = Pageview.new(pageview_params)

    respond_to do |format|
      if @pageview.save
        format.html { redirect_to @pageview, notice: 'Pageview was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pageview }
      else
        format.html { render action: 'new' }
        format.json { render json: @pageview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pageviews/1
  # PATCH/PUT /pageviews/1.json
  def update
    respond_to do |format|
      if @pageview.update(pageview_params)
        format.html { redirect_to @pageview, notice: 'Pageview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pageview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pageviews/1
  # DELETE /pageviews/1.json
  def destroy
    @pageview.destroy
    respond_to do |format|
      format.html { redirect_to pageviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pageview
      @pageview = Pageview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pageview_params
      params.require(:pageview).permit(:post_id, :user_ip)
    end
end
