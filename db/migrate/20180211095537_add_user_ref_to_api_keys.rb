class AddUserRefToApiKeys < ActiveRecord::Migration[5.1]
  def change
    add_reference :api_keys, :user, index: true
  end
end
