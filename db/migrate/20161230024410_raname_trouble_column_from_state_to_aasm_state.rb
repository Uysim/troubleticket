class RanameTroubleColumnFromStateToAasmState < ActiveRecord::Migration[5.0]
  def change
    rename_column :troubles, :state, :aasm_state
  end
end
