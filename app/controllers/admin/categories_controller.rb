class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "カテゴリの登録は完了しました"
    else
      @category = category.all
      render :index
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    redirect_to admin_categories_path, notice: "変更が保存されました。"
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: "削除されました。"
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end