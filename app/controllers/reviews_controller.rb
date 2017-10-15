class ReviewsController < ApplicationController
    before_filter :authorize

    def create
        @product = Product.find(params[:product_id])
        @review = Review.new (review_params)
        @review.product = @product
        @review.user = current_user
        if @review.save
            redirect_to @product, notice: 'Review was successfully posted'
        else
            render template: 'products/show'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @product = Product.find(params[:product_id])
        @review.destroy
        redirect_to :back
    end

    private
    
    def review_params
        params.require(:review).permit(:description, :rating)
    end
end
