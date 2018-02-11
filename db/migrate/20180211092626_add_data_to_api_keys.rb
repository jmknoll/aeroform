class AddDataToApiKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :api_keys, :key, :string
  end
end
