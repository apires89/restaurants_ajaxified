class ReviewsController < ApplicationController
  before_action :set_restaurant
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js  # <-- idem render 'restaurants/show'
      end
    end
  end







  private

  def review_params
    params.require(:review).permit(:content)
  end


  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
