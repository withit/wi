class AddAttachmentsTabHoverTabBannerAndMenuHeadingToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :tab_file_name, :string
    add_column :pages, :tab_content_type, :string
    add_column :pages, :tab_file_size, :integer
    add_column :pages, :hover_tab_file_name, :string
    add_column :pages, :hover_tab_content_type, :string
    add_column :pages, :hover_tab_file_size, :integer
    add_column :pages, :banner_file_name, :string
    add_column :pages, :banner_content_type, :string
    add_column :pages, :banner_file_size, :integer
    add_column :pages, :menu_heading_file_name, :string
    add_column :pages, :menu_heading_content_type, :string
    add_column :pages, :menu_heading_file_size, :integer
  end

  def self.down
    remove_column :pages, :tab_file_name
    remove_column :pages, :tab_content_type
    remove_column :pages, :tab_file_size
    remove_column :pages, :hover_tab_file_name
    remove_column :pages, :hover_tab_content_type
    remove_column :pages, :hover_tab_file_size
    remove_column :pages, :banner_file_name
    remove_column :pages, :banner_content_type
    remove_column :pages, :banner_file_size
    remove_column :pages, :menu_heading_file_name
    remove_column :pages, :menu_heading_content_type
    remove_column :pages, :menu_heading_file_size
  end
end
