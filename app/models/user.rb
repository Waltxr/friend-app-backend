class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password_digest

  has_many :comments

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :filed_grievances, :class_name => 'Grievance', :foreign_key => 'reporter_id'
  has_many :grievance_recipients
  has_many :received_grievances, :through => :grievance_recipients, :source => :grievance

  has_many :awarded_valid_points, :class_name => 'ValidPoint', :foreign_key => 'reporter_id'
  has_many :received_valid_points, :class_name => 'ValidPoint', :foreign_key => 'receiver_id'

  has_many :awarded_lols, :class_name => 'Lol', :foreign_key => 'reporter_id'
  has_many :received_lols, :class_name => 'Lol', :foreign_key => 'receiver_id'

  has_many :reported_proclamations, :class_name => 'Proclamation', :foreign_key => 'reporter_id'
  has_many :received_proclamations, :class_name => 'Proclamation', :foreign_key => 'receiver_id'

  has_many :reported_quotes, :class_name => 'Quote', :foreign_key => 'reporter_id'
  has_many :received_quotes, :class_name => 'Quote', :foreign_key => 'receiver_id'

  has_many :cited_sources, :class_name => 'Source', :foreign_key => 'reporter_id'
  has_many :received_sources, :class_name => 'Source', :foreign_key => 'receiver_id'

  has_many :invitations_sent, :class_name => 'Invitation', :foreign_key => 'sender_id'
  has_many :invitations_received, :class_name => 'Invitation', :foreign_key => 'receiver_id'

  has_many :requests_sent, :class_name => 'Request', :foreign_key => 'user_id'
  has_many :requests_approved, :class_name => 'Request', :foreign_key => 'approver_id'
end
