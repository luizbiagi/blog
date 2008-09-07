class BlogUsersController < ApplicationController
  # GET /blog_users
  # GET /blog_users.xml
  def index
    @blog_users = BlogUser.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blog_users }
    end
  end

  # GET /blog_users/1
  # GET /blog_users/1.xml
  def show
    @blog_user = BlogUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog_user }
    end
  end

  # GET /blog_users/new
  # GET /blog_users/new.xml
  def new
    @blog_user = BlogUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog_user }
    end
  end

  # GET /blog_users/1/edit
  def edit
    @blog_user = BlogUser.find(params[:id])
  end

  # POST /blog_users
  # POST /blog_users.xml
  def create
    @blog_user = BlogUser.new(params[:blog_user])

    respond_to do |format|
      if @blog_user.save
        flash[:notice] = 'BlogUser was successfully created.'
        format.html { redirect_to(@blog_user) }
        format.xml  { render :xml => @blog_user, :status => :created, :location => @blog_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blog_users/1
  # PUT /blog_users/1.xml
  def update
    @blog_user = BlogUser.find(params[:id])

    respond_to do |format|
      if @blog_user.update_attributes(params[:blog_user])
        flash[:notice] = 'BlogUser was successfully updated.'
        format.html { redirect_to(@blog_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_users/1
  # DELETE /blog_users/1.xml
  def destroy
    @blog_user = BlogUser.find(params[:id])
    @blog_user.destroy

    respond_to do |format|
      format.html { redirect_to(blog_users_url) }
      format.xml  { head :ok }
    end
  end
end
