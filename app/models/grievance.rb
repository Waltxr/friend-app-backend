class Grievance < ApplicationRecord
  # include ReporterReceiver
  include Commentable
  belongs_to :reporter, class_name: 'User'
  has_many :grievance_recipients
  has_many :receivers, through: :grievance_recipients
end
