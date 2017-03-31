class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :subjects
      t.string :code

      t.timestamps
    end
  end
end
