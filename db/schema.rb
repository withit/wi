# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100217044640) do

  create_table "assets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
  end

  create_table "banners", :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "sample_layout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flash_file_name"
    t.string   "flash_content_type"
    t.integer  "flash_file_size"
    t.string   "swf_file_name"
    t.string   "swf_content_type"
    t.integer  "swf_file_size"
    t.string   "flv_file_name"
    t.string   "flv_content_type"
    t.integer  "flv_file_size"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "message"
    t.string   "author_name"
    t.string   "author_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enquiries", :force => true do |t|
    t.string   "name"
    t.text     "message"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "position"
    t.string   "title"
    t.boolean  "subscribed"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_letters", :force => true do |t|
    t.string   "name"
    t.string   "keywords"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "keywords"
    t.string   "permalink"
    t.text     "description"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.boolean  "is_wrapper"
    t.string   "tab_file_name"
    t.string   "tab_content_type"
    t.integer  "tab_file_size"
    t.string   "hover_tab_file_name"
    t.string   "hover_tab_content_type"
    t.integer  "hover_tab_file_size"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.string   "menu_heading_file_name"
    t.string   "menu_heading_content_type"
    t.integer  "menu_heading_file_size"
    t.string   "browser_title"
    t.integer  "position"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "author_name"
    t.text     "content"
    t.integer  "tweets_count"
    t.integer  "comments_count"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_footer"
    t.string   "slide_file_name"
    t.string   "slide_content_type"
    t.integer  "slide_file_size"
    t.integer  "position"
    t.boolean  "helped"
    t.boolean  "current"
    t.boolean  "in_slideshow"
  end

  create_table "sample_layouts", :force => true do |t|
    t.integer  "banner_height"
    t.integer  "banner_width"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
