class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:index, :edit, :update]
  before_filter :the_right_user, only: [:edit, :update]

  expose(:user)

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    if user.save
      sign_in user
      flash[:success] = "Welcome to a Better Twitter!"
      redirect_to(user)
    else
      render :new
    end
  end

  def update
    if user.update_attributes(params[:user])
      sign_in user
      flash[:success] = "Profile updated"
      redirect_to user
    else
    render 'edit'
  end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_path, notice: "Please sign in"
      end
    end

    def the_right_user
      redirect_to root_path unless current_user?(user)
    end
end
