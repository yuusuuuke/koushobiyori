class Public::ApiSearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :search_result]
  
  def search_result
#空の配列を作成
    @books = []
    @title = params[:title]
    if @title.present?
#resultsに楽天APIから取得したデータ（jsonデータ）を格納。
#今回は書籍のタイトルを検索し、一致するデータを格納するように設定。
      results = RakutenWebService::Books::Book.search({
        title: @title,
      })
#@booksにAPIからの取得したJSONデータを格納していきます。
#read(result):privateメソッド
      results.each do |result|
        book = Book.new(read(result))
        @books << book  #<<:ハッシュを取り出す
      end
    end
  end
  
  def create
    result = RakutenWebService::Books::Book.search({
      isbn: params[:isbn],
    })
    @book = Book.find_by(isbn: result.params.values)
    if @book.present?
      redirect_to edit_admin_book_path(@book)
    else
      @books = Book.create!(read(result.response.as_json[0]["params"]))
        redirect_to edit_admin_book_path(@books), flash: { success: "#{@books.title}を追加しました。" }
    end
  end

  private
#「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    genre_code = result["booksGenreId"].slice!(0..5)
    category = Category.find_by(genre_code: genre_code)
#genre_codeとcategoryモデル内のgenre_codeと同じNo.を紐付け
#find_byでcategoryモデル内のgenre_codeのレコード情報取得。値はcategory変数に入ってる
    {
#左:Bookモデルのカラム名,右:取得したAPIのカラム名
    title: result["title"],
    author: result["author"],
    item_url: result["itemUrl"],
    isbn: result["isbn"],
    item_image_url: result["mediumImageUrl"].gsub('?_ex=120x120', ''),
    category_id: category&.id
    }
  end
  
  def ensure_guest_user
    @user = current_user
    if @user.nickname == "guestuser"
      redirect_to user_path(current_user), flash: { danger: "ゲストユーザーは本の登録権限がありません。アカウント作成後にご利用ください。"}
    end
  end
end
