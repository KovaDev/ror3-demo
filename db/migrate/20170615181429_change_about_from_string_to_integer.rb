class ChangeAboutFromStringToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :about, 'integer USING CAST(about AS integer)'
  end
end
