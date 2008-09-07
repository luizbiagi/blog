class CategoryPostsController < ApplicationController
  # GET /category_posts
  # GET /category_posts.xml
  def index
    @category_posts = CategoryPost.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @category_posts }
    end
  end

  # GET /category_posts/1
  # GET /category_posts/1.xml
  def show
    @category_post = CategoryPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_post }
    end
  end

  # GET /category_posts/new
  # GET /category_posts/new.xml
  def new
    @category_post = CategoryPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category_post }
    end
  end

  # GET /category_posts/1/edit
  def edit
    @category_post = CategoryPost.find(params[:id])
  end

  # POST /category_posts
  # POST /category_posts.xml
  def create
    @category_post = CategoryPost.new(params[:category_post])

    respond_to do |format|
      if @category_post.save
        flash[:notice] = 'CategoryPost was successfully created.'
        format.html { redirect_to(@category_post) }
        format.xml  { render :xml => @category_post, :status => :created, :location => @category_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /category_posts/1
  # PUT /category_posts/1.xml
  def update
    @category_post = CategoryPost.find(params[:id])

    respond_to do |format|
      if @category_post.update_attributes(params[:category_post])
        flash[:notice] = 'CategoryPost was successfully updated.'
        format.html { redirect_to(@category_post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_posts/1
  # DELETE /category_posts/1.xml
  def destroy
    @category_post = CategoryPost.find(params[:id])
    @category_post.destroy

    respond_to do |format|
      format.html { redirect_to(category_posts_url) }
      format.xml  { head :ok }
    end
  end
end
