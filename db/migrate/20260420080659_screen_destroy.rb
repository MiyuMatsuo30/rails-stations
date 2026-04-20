class ScreenDestroy < ActiveRecord::Migration[7.1]
  def change
    drop_table :screens
  end
end
