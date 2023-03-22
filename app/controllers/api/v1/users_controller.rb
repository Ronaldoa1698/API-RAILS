class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
  def create
    @user = User.new(user_params)
      if @user.save
        return render json:@user, status: :created
      end

    render json: @user.errors, status: :unprocessable_entity
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
