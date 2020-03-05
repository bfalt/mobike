class ChangeOwnerToAdmin < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :owner, :admin
    end
  end
end
