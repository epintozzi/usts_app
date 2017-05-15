class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all.order(last_name: :asc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "This user has successfully been updated."
      redirect_to admin_users_path
    else
      flash[:alert] = "Something went wrong. #{@user.errors.full_messages.join(' ')}. Please try again."
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :role)
  end

end
