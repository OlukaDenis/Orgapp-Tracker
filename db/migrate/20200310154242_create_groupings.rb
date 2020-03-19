# frozen_string_literal: true

class CreateGroupings < ActiveRecord::Migration[6.0]
  def change
    create_table :groupings do |t|
      t.references :project, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
