class AddIndexToScanAnalyses < ActiveRecord::Migration
  def change
    add_index :scan_analyses, :scanid, :unique => true
  end
end
