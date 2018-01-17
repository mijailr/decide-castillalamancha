class AddAuthorToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :decidim_news_posts, :decidim_user, foreign_key: true
  end
end
