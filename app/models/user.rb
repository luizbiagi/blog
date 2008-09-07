require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of   :login
  validates_length_of     :login, :within => 3..40
  validates_uniqueness_of :login, :case_sensitive => false
  validates_format_of     :login, :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

  validates_format_of     :name,  :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of     :name,  :maximum => 100

  validates_presence_of   :email
  validates_length_of     :email, :within => 6..100 #r@a.wk
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of     :email, :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD
  

  attr_accessible :login, :email, :name, :password, :password_confirmation
  attr_accessible :getimage #method for upload image to database
  
  has_many :blog_users
  has_many :blogs, :through => :blog_users
  has_many :posts
  has_many :comments

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def getimage=(img_field)
    image_types = ["image/jpeg", "image/pjpeg", "image/gif", "image/png", "image/x-png"]
    if !img_field.blank?
      if (img_field.size != 0)
        if (image_types.include?img_field.content_type.chomp)
          if img_field.size < 2097152
            img_field.rewind
            picture = Magick::Image.from_blob(img_field.read)[0]
            width = picture.columns
            height = picture.rows
            if (width > height)
              picture.scale!((180.0/width.to_f))
            else
              picture.scale!((180.0/height.to_f))
            end
            image_to_save = Magick::Image.new(180,180) {
              self.background_color = 'white'
              self.format = 'PNG'
            }
            image_to_save.composite!(picture, Magick::CenterGravity, Magick::InCompositeOp)
            self.image = image_to_save.to_blob
          else
            flash[:error] = "File size greater then 2 Megabytes, please upload a smaller file."
            render :action => 'upload_image', :id => self.id
          end
        else
          flash[:error] = "File doesn't seem to be JPG, GIF, or PNG, please ensure it is a valid image file."
          render :action => 'upload_image', :id => self.id
        end
      else
        flash[:error] = "Unable to upload the file you selected, please try again."
        render :action => 'upload_image', :id => self.id
      end
    else
      image_to_save = Magick::Image.new(180,180) {
        self.background_color = 'white'
        self.format = 'PNG'
      }
      image_to_save.composite!(image_to_save, Magick::CenterGravity, Magick::InCompositeOp)
      self.image = image_to_save.to_blob
    end
  end
  
  protected
    
end