class ScreenRelation < ActiveRecord::Migration[7.1]
  def change
    add_reference :screens, :sheet, null: false, foreign_key: true
  end
end
