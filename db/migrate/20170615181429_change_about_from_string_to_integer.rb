class ChangeAboutFromStringToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :about, 'integer USING CAST(column_name AS integer)'
  end
end
