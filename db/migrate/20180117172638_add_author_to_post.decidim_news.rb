# This migration comes from decidim_news (originally 20180117172638)
class AddAuthorToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :decidim_news_posts, :decidim_user, foreign_key: true
  end
end
