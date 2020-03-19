# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :author
      t.string :name
      t.integer :duration

      t.timestamps
    end
  end
end
