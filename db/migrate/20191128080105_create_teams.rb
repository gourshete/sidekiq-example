# frozen_string_literal: true

# Creates Teams Table in the DB
class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
