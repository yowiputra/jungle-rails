class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(name: :desc)
  end

  def new
    @category = Category.new
  end

end
