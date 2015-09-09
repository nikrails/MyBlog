# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150824131701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accommodation_descriptions", force: :cascade do |t|
    t.string   "locale",           limit: 255
    t.integer  "accommodation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "section_a"
    t.text     "section_b"
    t.text     "section_c"
  end

  add_index "accommodation_descriptions", ["accommodation_id"], name: "index_accommodation_descriptions_on_accommodation_id", using: :btree

  create_table "accommodation_inquiries", force: :cascade do |t|
    t.integer  "accommodation_id"
    t.integer  "inquiry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accommodation_inquiries", ["accommodation_id"], name: "index_accommodation_inquiries_on_accommodation_id", using: :btree
  add_index "accommodation_inquiries", ["inquiry_id"], name: "index_accommodation_inquiries_on_inquiry_id", using: :btree

  create_table "accommodations", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",              limit: 255
    t.integer  "user_id"
    t.integer  "persons_number"
    t.string   "country",           limit: 255
    t.integer  "business_owner_id"
  end

  add_index "accommodations", ["business_owner_id"], name: "index_accommodations_on_business_owner_id", using: :btree
  add_index "accommodations", ["persons_number"], name: "index_accommodations_on_persons_number", using: :btree
  add_index "accommodations", ["region_id"], name: "index_accommodations_on_region_id", using: :btree
  add_index "accommodations", ["type"], name: "index_accommodations_on_type", using: :btree
  add_index "accommodations", ["user_id"], name: "index_accommodations_on_user_id", using: :btree

  create_table "accommodations_leads", id: false, force: :cascade do |t|
    t.integer "lead_id"
    t.integer "accommodation_id"
  end

  add_index "accommodations_leads", ["lead_id", "accommodation_id"], name: "index_accommodations_leads_on_lead_id_and_accommodation_id", unique: true, using: :btree

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.string   "telephonenumber",        limit: 255
    t.boolean  "publish_contactpage",                default: false
    t.string   "address",                limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["role"], name: "index_admin_users_on_role", using: :btree

  create_table "avatars", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "file",           limit: 255
    t.string   "imageable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "booking_accommodations", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "accommodation_id"
    t.date     "from"
    t.date     "to"
    t.integer  "persons_number"
    t.integer  "rental_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commission"
    t.integer  "children_number"
    t.integer  "finance_status_id"
    t.float    "security_deposit"
    t.string   "accepted_status",     limit: 255
    t.string   "reply_on_request_by", limit: 255
    t.datetime "reply_on_request_at"
    t.string   "valid_reply_code",    limit: 255
    t.datetime "booking_request_at"
    t.string   "telephone_number",    limit: 255
  end

  add_index "booking_accommodations", ["accommodation_id"], name: "index_booking_accommodations_on_accommodation_id", using: :btree
  add_index "booking_accommodations", ["booking_id"], name: "index_booking_accommodations_on_booking_id", using: :btree
  add_index "booking_accommodations", ["finance_status_id"], name: "index_booking_accommodations_on_finance_status_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "source_type",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                                 default: 1
    t.integer  "customer_id"
    t.boolean  "by_houseowner",                          default: false
    t.boolean  "received_pre_payed_email"
    t.boolean  "received_fully_payed_email"
    t.boolean  "arrival_email"
    t.boolean  "reminder_pre_payed_email"
    t.boolean  "reminder_final_payed_email"
    t.boolean  "route_and_details_email"
    t.boolean  "tips_email"
    t.boolean  "feedback_email"
    t.boolean  "sent_prepayed"
    t.boolean  "sent_final_payed"
    t.datetime "sent_prepayed_date"
    t.datetime "sent_final_payed_date"
    t.datetime "option_upto"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
  add_index "bookings", ["source_id", "source_type"], name: "index_bookings_on_source_id_and_source_type", using: :btree

  create_table "business_owners", force: :cascade do |t|
    t.string   "business_name",          limit: 255
    t.string   "telephone",              limit: 255
    t.string   "surname",                limit: 255
    t.string   "email",                  limit: 255
    t.string   "address",                limit: 255
    t.string   "zipcode",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "bank_number",            limit: 255
    t.string   "vat_number",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country",                limit: 255
    t.integer  "admin_user_id"
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "cellphone",              limit: 255
  end

  add_index "business_owners", ["reset_password_token"], name: "index_business_owners_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["booking_id"], name: "index_categorizations_on_booking_id", using: :btree
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "surname",    limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "country",    limit: 255
    t.string   "zip",        limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",   limit: 255
  end

  create_table "finance_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "inquiries", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "surname",     limit: 255
    t.date     "from"
    t.date     "to"
    t.date     "valid_until"
    t.text     "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",        limit: 255
  end

  add_index "inquiries", ["slug"], name: "index_inquiries_on_slug", unique: true, using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "business_owner_id"
    t.integer "number"
    t.date    "created_at"
  end

  add_index "invoices", ["booking_id"], name: "index_invoices_on_booking_id", using: :btree
  add_index "invoices", ["business_owner_id"], name: "index_invoices_on_business_owner_id", using: :btree

  create_table "leads", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.text     "extra_information"
    t.hstore   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "generated",         limit: 255
    t.integer  "user_id"
    t.integer  "customer_id"
  end

  add_index "leads", ["customer_id"], name: "index_leads_on_customer_id", using: :btree
  add_index "leads", ["from"], name: "index_leads_on_from", using: :btree
  add_index "leads", ["generated"], name: "index_leads_on_generated", using: :btree
  add_index "leads", ["status"], name: "index_leads_on_status", using: :gin
  add_index "leads", ["to"], name: "index_leads_on_to", using: :btree
  add_index "leads", ["user_id"], name: "index_leads_on_user_id", using: :btree

  create_table "not_available_days", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.integer  "accommodation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "booking_accommodation_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_accommodations", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "accommodation_id"
    t.date     "from"
    t.date     "to"
    t.date     "valid_to"
    t.text     "extra_information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_accommodations", ["accommodation_id"], name: "index_option_accommodations_on_accommodation_id", using: :btree
  add_index "option_accommodations", ["from"], name: "index_option_accommodations_on_from", using: :btree
  add_index "option_accommodations", ["option_id"], name: "index_option_accommodations_on_option_id", using: :btree
  add_index "option_accommodations", ["to"], name: "index_option_accommodations_on_to", using: :btree
  add_index "option_accommodations", ["valid_to"], name: "index_option_accommodations_on_valid_to", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "lead_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "options", ["customer_id"], name: "index_options_on_customer_id", using: :btree
  add_index "options", ["lead_id"], name: "index_options_on_lead_id", using: :btree

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.string   "image"
    t.boolean  "publish",     default: false
    t.string   "slug"
    t.string   "locale"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "temps", force: :cascade do |t|
    t.text     "reply_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_no"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.date     "birth_date"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "identities", "users"
end
