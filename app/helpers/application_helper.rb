module ApplicationHelper
  
  # ページ事の完全なタイトルを返します
  def full_title(page_title = '')
    base_title = "名刺管理サービス"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
