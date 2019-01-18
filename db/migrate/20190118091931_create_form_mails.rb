class CreateFormMails < ActiveRecord::Migration[5.1]
  def change
    create_table :form_mails do |t|
      t.references :user, foreign_key: true
      t.string :sender
      t.string :recipient
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
