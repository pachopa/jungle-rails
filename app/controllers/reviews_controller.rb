class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = 'created new rating'
      redirect_to(:back)
    else
      flash[:error] = 'Error, rating did not create'
      redirect_to(:back)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end