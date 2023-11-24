class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @food = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find_by_id(params[:id])
  end

  def create
    @food = Food.new(foods_data)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy
      redirect_to foods_path, notice: 'Food has been deleted!'
    else
      redirect_to foods_path, alert: 'There is an error deleting the food!'
    end
  end

  private

  def foods_data
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
