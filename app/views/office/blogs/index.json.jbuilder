json.array!(@office_blogs) do |office_blog|
  json.extract! office_blog, :id, :title
  json.url office_blog_url(office_blog, format: :json)
end
