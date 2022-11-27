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
      flash[:success] = "カテゴリー『#{@category.name}』の新規登録は完了しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリー『#{@category.name}』の新規登録に失敗しました"
      @category = Category.new
      @categories = Category.all
      render "index"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "カテゴリー『#{@category.name}』の編集内容を保存しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリー『#{@category.name}』の編集内容は保存できませんでした"
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy 
      flash[:success] = "カテゴリー『#{@category.name}』を削除しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリー『#{@category.name}』を削除できませんでした"
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :genre_code)
  end
end