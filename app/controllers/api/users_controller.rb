class Api::UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  before_action :set_user, only: :show

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # GET /users/:id
  def show
    json_response_user(@user)
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    @user = User.create!(user_params)
    @auth_token = AuthenticateUser.new(@user.email, @user.password).call
    @response = { message: Message.account_created, auth_token: @auth_token }
    json_response(@response, :created)
  end

  # PUT /users/edit
  def update
    current_user.update(user_params)
    json_response_user(current_user)
  end

  # DELETE /users/destroy
  def destroy
    current_user.destroy
    head :no_content
  end

  #POST users/find_user
  def find
   @user = User.find_by(email: params[:user][:email])

   if @user
     render json: @user
   else
     byebug
     @errors = @user.errors.full_messages
     render json: @errors
   end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :email, :password)
  end

end