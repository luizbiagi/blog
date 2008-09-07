class UsersController < ApplicationController

  def index
    @users = User.paginate :page => params[:page], 
      :order => :login, :per_page => 5
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end  
  
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      self.current_user = @user # !! now logged in
            redirect_back_or_default('/home')
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again."
      render :action => 'new'
    end
  end
  
  def edit
    #TODO User must only edit his acct current_user.login maybe should do the work(like in user index unless conditions)
    @user = User.find(params[:id])
##    if  current_user.login != @user.login
##      flash[:error]  = "You can't edit other user account"
##      redirect_to(users_url)
##    end
  end  
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def showimagectlr
    @user = User.find(params[:id])
    send_data(@user.image, :type=> "image/png", :disposition=>"inline")
  end  
end
