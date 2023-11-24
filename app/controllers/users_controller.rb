class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    return unless @user.nil? || @user == current_user

    # Handle sign-out scenario
    redirect_to new_user_registration_path, notice: 'Signed out successfully.'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # edit
  def edit; end

  # POST users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT users
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Share common setup or constraints.
  def set_user
    if params[:id] == 'sign_out'
      # No need to find a user when signing out
      sign_out(current_user) if current_user
      @user = nil
    else
      @user = User.find(params[:id])
    end
  end

  # Only allow trusted parameters.
  def user_params
    params.require(:user).permit(:name)
  end
end
