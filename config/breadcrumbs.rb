crumb :root do
  link "トップページ", root_path
end

crumb :posts do
  link "投稿一覧", posts_path
  parent :root
end

crumb :search do |keyword|
  link "#{keyword}の検索結果", search_posts_path
  parent :posts
end

crumb :new_post do
  link "新規投稿", new_post_path
  parent :posts
end

crumb :user_page do |user|
  link "#{user.name}さんのマイページ", users_show_path
  parent :posts
end

crumb :novel do
  link "小説", novel_posts_path
  parent :posts
end

crumb :movie do
  link "映画", movie_posts_path
  parent :posts
end

crumb :comic do
  link "マンガ", comic_posts_path
  parent :posts
end

crumb :anime do
  link "アニメ", anime_posts_path
  parent :posts
end

crumb :post do |post|
  link post.title, post_path(post)
  case post.category.name
  when "小説"
    parent :novel
  when "映画"
    parent :movie
  when "マンガ"
    parent :comic
  when "アニメ"
    parent :anime
  end
end

crumb :edit_post do |post|
  link "編集", edit_post_path
  parent :post, post
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).