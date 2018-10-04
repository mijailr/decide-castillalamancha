# This migration comes from decidim_news (originally 20181004064608)
class AddPublicableToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_news_posts, :published_at, :datetime, index: true
  end
end
