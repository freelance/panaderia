class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :invoice_id
      t.string :provider_id
      t.integer :expense_id

      t.timestamps null: false
    end
  end
end
