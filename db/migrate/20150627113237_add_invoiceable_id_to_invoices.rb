class AddInvoiceableIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :invoiceable_id, :integer
    add_column :invoices, :invoiceable_type, :string
  end
end
