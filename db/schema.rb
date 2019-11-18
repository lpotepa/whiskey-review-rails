# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_117_113_316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_trgm'
  enable_extension 'plpgsql'

  create_table 'ratings', force: :cascade do |t|
    t.integer 'rating_type'
    t.string 'ratable_type'
    t.bigint 'ratable_id'
    t.integer 'grade'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[ratable_type ratable_id], name: 'index_ratings_on_ratable_type_and_ratable_id'
    t.index %w[rating_type grade], name: 'index_ratings_on_rating_type_and_grade'
    t.index %w[rating_type ratable_id], name: 'index_ratings_on_rating_type_and_ratable_id', unique: true
  end

  create_table 'whiskeys', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['description'], name: 'index_whiskeys_on_description', opclass: :gin_trgm_ops, using: :gin
    t.index ['name'], name: 'index_whiskeys_on_name', opclass: :gin_trgm_ops, using: :gin
  end
end
