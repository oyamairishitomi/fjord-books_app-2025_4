# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioned_report_mentions, class_name: 'ReportMention', foreign_key: :mentioned_report_id, dependent: :destroy, inverse_of: :mentioned_report
  has_many :mentioned_reports, through: :mentioned_report_mentions, source: :mentioning_report

  has_many :mentioning_report_mentions, class_name: 'ReportMention', foreign_key: :mentioning_report_id, dependent: :destroy, inverse_of: :mentioning_report
  has_many :mentioning_reports, through: :mentioning_report_mentions, source: :mentioned_report

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end
end
