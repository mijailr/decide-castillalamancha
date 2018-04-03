# This migration comes from decidim_news (originally 20180107225838)
# frozen_string_literal: true

class CreateDecidimNewsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_news_posts do |t|
      t.jsonb :title, null: false
      t.string :slug, null: false
      t.jsonb :content, null: false
      t.references :decidim_organization, foreign_key: true, index: true
      t.timestamps
    end
  end
end
