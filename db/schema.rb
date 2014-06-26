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

ActiveRecord::Schema.define(version: 20140413200416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "admins", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiences_courses", force: true do |t|
    t.integer "audience_id"
    t.integer "course_id"
  end

  add_index "audiences_courses", ["audience_id"], name: "index_audiences_courses_on_audience_id", using: :btree
  add_index "audiences_courses", ["course_id"], name: "index_audiences_courses_on_course_id", using: :btree

  create_table "auths", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auths", ["provider"], name: "index_auths_on_provider", using: :btree
  add_index "auths", ["uid"], name: "index_auths_on_uid", using: :btree
  add_index "auths", ["user_id"], name: "index_auths_on_user_id", using: :btree

  create_table "availabilities", force: true do |t|
    t.string   "schedule_type"
    t.date     "date_of_week"
    t.text     "slots"
    t.integer  "user_id"
    t.integer  "tutor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["schedule_type"], name: "index_availabilities_on_schedule_type", using: :btree
  add_index "availabilities", ["tutor_id"], name: "index_availabilities_on_tutor_id", using: :btree
  add_index "availabilities", ["user_id"], name: "index_availabilities_on_user_id", using: :btree

  create_table "buildings", force: true do |t|
    t.string   "address",     null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.integer  "zip",         null: false
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_courses", force: true do |t|
    t.integer  "category_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_courses", ["category_id"], name: "index_categories_courses_on_category_id", using: :btree
  add_index "categories_courses", ["course_id"], name: "index_categories_courses_on_course_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "connect_requests", force: true do |t|
    t.integer  "best_time",              default: 1
    t.text     "additional_information"
    t.text     "introduction"
    t.integer  "user_id"
    t.integer  "tutor_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "conversations", ["course_id"], name: "index_conversations_on_course_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "title"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.decimal  "duration"
    t.decimal  "additional_charges"
    t.text     "terms"
    t.boolean  "active",               default: false
    t.datetime "published"
    t.string   "category"
    t.integer  "tutor_id"
    t.text     "goals"
    t.text     "pedagogy"
    t.text     "expertise"
    t.boolean  "search_listed",        default: true
    t.decimal  "discounted_price"
    t.integer  "discounted_min_hours"
    t.integer  "category_id"
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["tutor_id"], name: "index_courses_on_tutor_id", using: :btree

  create_table "courses_subjects", id: false, force: true do |t|
    t.integer "subject_id", null: false
    t.integer "course_id",  null: false
  end

  add_index "courses_subjects", ["course_id"], name: "index_courses_subjects_on_course_id", using: :btree
  add_index "courses_subjects", ["subject_id"], name: "index_courses_subjects_on_subject_id", using: :btree

  create_table "courses_uses", force: true do |t|
    t.integer "use_id"
    t.integer "course_id"
  end

  add_index "courses_uses", ["course_id"], name: "index_courses_uses_on_course_id", using: :btree
  add_index "courses_uses", ["use_id"], name: "index_courses_uses_on_use_id", using: :btree

  create_table "credit_cards", force: true do |t|
    t.string   "last4"
    t.string   "exp_month"
    t.string   "exp_year"
    t.integer  "stripe_account_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["stripe_account_id"], name: "index_credit_cards_on_stripe_account_id", using: :btree

  create_table "degrees", force: true do |t|
    t.integer  "school_id"
    t.string   "major"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "year"
    t.string   "school"
    t.integer  "user_id"
  end

  add_index "degrees", ["school_id"], name: "index_degrees_on_school_id", using: :btree
  add_index "degrees", ["user_id"], name: "index_degrees_on_user_id", using: :btree

  create_table "emaillogs", force: true do |t|
    t.text     "full_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "conversation_id"
    t.string   "message_identifier"
    t.string   "email_to"
  end

  add_index "emaillogs", ["conversation_id"], name: "index_emaillogs_on_conversation_id", using: :btree
  add_index "emaillogs", ["email_to"], name: "index_emaillogs_on_email_to", using: :btree
  add_index "emaillogs", ["message_identifier"], name: "index_emaillogs_on_message_identifier", using: :btree
  add_index "emaillogs", ["recipient_id"], name: "index_emaillogs_on_recipient_id", using: :btree
  add_index "emaillogs", ["sender_id"], name: "index_emaillogs_on_sender_id", using: :btree

  create_table "experiences", force: true do |t|
    t.string   "employer"
    t.integer  "user_id"
    t.string   "job_title"
    t.string   "job_location"
    t.date     "job_start_date"
    t.date     "job_end_date"
    t.boolean  "present_job"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "guests", force: true do |t|
    t.string   "email"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_tutor"
  end

  create_table "meetings", force: true do |t|
    t.datetime "time"
    t.string   "status"
    t.integer  "tutor_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "location"
    t.text     "plan"
    t.decimal  "duration",         precision: 4, scale: 2
    t.decimal  "price",            precision: 7, scale: 2
    t.integer  "course_id"
    t.integer  "conversation_id"
    t.text     "message"
    t.boolean  "accept_bnt_terms",                         default: false
  end

  add_index "meetings", ["conversation_id"], name: "index_meetings_on_conversation_id", using: :btree
  add_index "meetings", ["course_id"], name: "index_meetings_on_course_id", using: :btree
  add_index "meetings", ["tutor_id"], name: "index_meetings_on_tutor_id", using: :btree
  add_index "meetings", ["user_id"], name: "index_meetings_on_user_id", using: :btree

  create_table "message_boxes", force: true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  add_index "message_boxes", ["conversation_id"], name: "index_message_boxes_on_conversation_id", using: :btree
  add_index "message_boxes", ["message_id"], name: "index_message_boxes_on_message_id", using: :btree
  add_index "message_boxes", ["name"], name: "index_message_boxes_on_name", using: :btree
  add_index "message_boxes", ["user_id"], name: "index_message_boxes_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "recipient_id"
    t.boolean  "read",               default: false
    t.string   "status",             default: "draft"
    t.datetime "sent_at"
    t.string   "non_user_sender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.string   "message_identifier"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "objectives", force: true do |t|
    t.string   "name"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "objectives", ["unit_id"], name: "index_objectives_on_unit_id", using: :btree
  add_index "objectives", ["user_id"], name: "index_objectives_on_user_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer "user_id"
    t.integer "credit_card_id"
    t.integer "tutor_id"
    t.integer "meeting_id"
    t.string  "charge_id"
    t.integer "amount"
  end

  add_index "orders", ["charge_id"], name: "index_orders_on_charge_id", using: :btree
  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
  add_index "orders", ["meeting_id"], name: "index_orders_on_meeting_id", using: :btree
  add_index "orders", ["tutor_id"], name: "index_orders_on_tutor_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "pic"
    t.string   "content_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.string   "shape"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "ruby_gems", force: true do |t|
    t.string   "name",        null: false
    t.string   "author"
    t.text     "description", null: false
    t.string   "github_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ruby_gems", ["name"], name: "index_ruby_gems_on_name", unique: true, using: :btree

  create_table "stripe_accounts", force: true do |t|
    t.string   "stripe_id"
    t.integer  "user_id"
    t.boolean  "delinquent", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stripe_accounts", ["stripe_id"], name: "index_stripe_accounts_on_stripe_id", using: :btree
  add_index "stripe_accounts", ["user_id"], name: "index_stripe_accounts_on_user_id", using: :btree

  create_table "stripe_recipients", force: true do |t|
    t.string   "stripe_id"
    t.string   "name"
    t.string   "recipient_id"
    t.string   "account_type"
    t.string   "ba_country"
    t.string   "ba_bank_name"
    t.string   "ba_last4"
    t.boolean  "ba_validated"
    t.string   "ba_fingerprint"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "active",        default: false
    t.integer  "courses_count", default: 0
    t.string   "status",        default: "pending"
    t.integer  "city_id"
    t.string   "city"
  end

  add_index "tutors", ["city"], name: "index_tutors_on_city", using: :btree
  add_index "tutors", ["city_id"], name: "index_tutors_on_city_id", using: :btree
  add_index "tutors", ["user_id"], name: "index_tutors_on_user_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["course_id"], name: "index_units_on_course_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                   default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "temporary_pass"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "gender"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "zip"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.text     "expertise"
    t.string   "job_title"
    t.string   "job_location"
    t.date     "job_start_date"
    t.string   "employer"
    t.integer  "stripe_account_id"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "display_welcome_message", default: true
    t.datetime "deleted_at"
    t.boolean  "is_deleted",              default: false
    t.integer  "num_of_connections"
    t.string   "resume"
    t.string   "student_first_name"
    t.string   "student_last_name"
    t.boolean  "is_parent",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["stripe_account_id"], name: "index_users_on_stripe_account_id", using: :btree

  create_table "users_conversations", force: true do |t|
    t.integer "user_id"
    t.integer "conversation_id"
  end

  add_index "users_conversations", ["conversation_id"], name: "index_users_conversations_on_conversation_id", using: :btree
  add_index "users_conversations", ["user_id"], name: "index_users_conversations_on_user_id", using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "uses", force: true do |t|
    t.string "name"
  end

end
