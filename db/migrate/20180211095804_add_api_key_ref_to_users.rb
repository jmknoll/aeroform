class AddApiKeyRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :api_key, index: true
  end
end
