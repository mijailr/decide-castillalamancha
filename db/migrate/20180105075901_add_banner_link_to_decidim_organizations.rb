class AddBannerLinkToDecidimOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :banner_link, :string
  end
end
