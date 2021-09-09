crumb :root do
  link "Home", root_path
end

crumb :new_item do
  link "商品出品ページ", new_item_path
  parent :root
end

crumb :search_items do
  link "検索結果ページ", search_items_path
  parent :root
end


crumb :item_show do |item|
  link "#{item.name}の商品詳細", item_path(item)
  parent :root
end

crumb :items_edit do |item|
  link "出品商品編集ページ"
  parent :item_show, item
end


crumb :orders do |item|
  link "#{item.name}の商品購入ページ"
  parent :item_show, item
end



crumb :registrations_new do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :sessions_new do
  link "ログイン", new_user_session_path
  parent :root
end





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