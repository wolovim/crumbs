class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.string :company
      t.string :responsibilities
      t.date :start_date
      t.date :end_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
