class BackfillUserIdInBooks < ActiveRecord::Migration[8.0]
  def change
    Book.update_all(user_id: 1)
  end
end
