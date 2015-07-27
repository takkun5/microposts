class UsersController < ApplicationController
  before_action :set_user,
                only: [:show, :edit, :update, :destroy, :following, :follower]
  
  
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end 
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
 
 def edit
   @user = current_user
 end
 
  def update
   @user = current_user
   if @user.update(user_profile)
      flash[:success]= "Your profile edition complete!" 
      redirect_to user_path(@user)
   else
     render 'edit'
   end
  end   
 
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following_users
    # @users = @user.followed_users.paginate(page: params[:page])
    # render 'show_follow'
  end
 
  def follower
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followed_users
    #@users = @user.followed_users.paginate(page: params[:page])
    #render 'show_follow'
  end
 

 private
  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation,)
    
  end
  
  def user_profile
    params.require(:user).permit(:name, :email, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
 end