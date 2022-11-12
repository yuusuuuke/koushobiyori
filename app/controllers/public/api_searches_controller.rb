class Public::ApiSearchesController < ApplicationController
  def search_result
#ここで空の配列を作ります
    @books = []
    @title = params[:title]
    if @title.present?
#この部分でresultsに楽天APIから取得したデータ（jsonデータ）を格納します。
#今回は書籍のタイトルを検索して、一致するデータを格納するように設定しています。
      results = RakutenWebService::Books::Book.search({
        title: @title,
      })
#この部分で「@books」にAPIからの取得したJSONデータを格納していきます。
#read(result)については、privateメソッドとして、設定しております。
      results.each do |result|
#下位置
        book = Book.new(read(result))
        @books << book  #<<何？ハッシュを取り出す
      end
    end
  end
  
  def create
    result = RakutenWebService::Books::Book.search({
      isbn: params[:isbn],
    })
    Book.find_or_create_by!(read(result.response.as_json[0]["params"]))
    redirect_to request.referer
  end

  private
#「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    title = result["title"]
    author = result["author"]
    item_url = result["itemUrl"]
    isbn = result["isbn"]
    item_image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    genre_name = result["booksGenreId"].slice!(0..5).to_i
    category = Category.find_by(genre_code: genre_name)
    {
      title: title,
      author: author,
      item_url: item_url,
      isbn: isbn,
      item_image_url: item_image_url,
      genre_name: genre_name,
      # read_status: 0
    }
  end
  
  def book_params
    params.require(:book).permit(:title)
  end
    
end
