# frozen_string_literal: true

class CreateWhiskeys < ActiveRecord::Migration[6.0]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :whiskeys, :name, using: :gin, opclass: :gin_trgm_ops
    add_index :whiskeys, :description, using: :gin, opclass: :gin_trgm_ops
  end
end
