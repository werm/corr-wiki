class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def sidebar_pages
    @pages = Page.all.limit(10)
    sidebar = {
      :pages => @pages
    }
    render :json => sidebar.to_json
  end

  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @author = User.all
    respond_to do |format|
      format.html
      format.json { render json: @author }
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    render layout: 'page_form'
  end

  # GET /pages/1/edit
  def edit
    render layout: 'page_form'
  end

  def create
    @page = Page.new(page_params)
    # @page.render_body

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :wiki_title, :body, :body_html, :user_id, :revision)
    end
end
