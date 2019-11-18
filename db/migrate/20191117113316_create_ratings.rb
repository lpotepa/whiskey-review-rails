# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rating_type
      t.references :ratable, polymorphic: true
      t.integer :grade
      t.timestamps
    end
    add_index :ratings, %i[rating_type ratable_id], unique: true
    add_index :ratings, %i[rating_type grade]
  end
end
