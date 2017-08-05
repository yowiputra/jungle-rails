class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      render :'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to @review.product, notice: 'Review deleted!'
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
