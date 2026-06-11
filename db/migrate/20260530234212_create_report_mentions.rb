class CreateReportMentions < ActiveRecord::Migration[8.0]
  def change
    create_table :report_mentions do |t|
      t.integer :mentioning_report_id, null: false
      t.integer :mentioned_report_id, null: false

      t.timestamps
    end

    add_foreign_key :report_mentions, :reports, column: :mentioning_report_id, on_delete: :cascade
    add_foreign_key :report_mentions, :reports, column: :mentioned_report_id, on_delete: :cascade
    add_index :report_mentions, [:mentioning_report_id, :mentioned_report_id], unique: true
    add_index :report_mentions, :mentioned_report_id
  end
end
