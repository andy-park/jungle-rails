class Admin::CategoriesController < ApplicationController
    
    before_filter :authenticate

    def new
        @category = Category.new
    end

    def index
        @categories = Category.order(id: :desc).all
    end

    def create
        @category = Category.new category_params
        if @category.save
            redirect_to '/admin/categories'      
        else 
            render :new
        end
    end

    private 
    def category_params
        params.require(:category).permit(:name)
    end

end
  