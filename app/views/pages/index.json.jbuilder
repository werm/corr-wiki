json.array!(@pages) do |page|
  json.extract! page, :title, :wiki_title, :body, :body_html, :user_id, :revision
  json.url page_url(page, format: :json)
end
