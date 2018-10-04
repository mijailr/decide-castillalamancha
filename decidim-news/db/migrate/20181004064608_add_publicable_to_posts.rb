class AddPublicableToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_news_posts, :published_at, :datetime, index: true
  end
end
