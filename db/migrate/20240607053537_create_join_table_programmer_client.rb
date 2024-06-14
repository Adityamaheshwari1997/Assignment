class CreateJoinTableProgrammerClient < ActiveRecord::Migration[7.0]
  def change
    create_join_table :programmers, :clients do |t|
      t.index [:programmer_id, :client_id]
      # t.index [:client_id, :programmer_id]
    end
  end
end
