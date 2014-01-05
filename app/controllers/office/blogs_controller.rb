class Office::BlogsController < ApplicationController
  before_action :set_office_blog, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /office/blogs
  # GET /office/blogs.json
  def index
    @office_blogs = Office::Blog.all
  end

  # GET /office/blogs/1
  # GET /office/blogs/1.json
  def show
  end

  # GET /office/blogs/new
  def new
    @office_blog = Office::Blog.new
  end

  # GET /office/blogs/1/edit
  def edit
  end

  # POST /office/blogs
  # POST /office/blogs.json
  def create
    @office_blog = Office::Blog.new(office_blog_params)

    respond_to do |format|
      if @office_blog.save
        format.html { redirect_to @office_blog, notice: 'Blog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @office_blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @office_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office/blogs/1
  # PATCH/PUT /office/blogs/1.json
  def update
    respond_to do |format|
      if @office_blog.update(office_blog_params)
        format.html { redirect_to @office_blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @office_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office/blogs/1
  # DELETE /office/blogs/1.json
  def destroy
    @office_blog.destroy
    respond_to do |format|
      format.html { redirect_to office_blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_blog
      @office_blog = Office::Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_blog_params
      params.require(:office_blog).permit(:title)
    end
end
