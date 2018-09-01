# frozen_string_literal: true

class Comment < ApplicationRecord
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  belongs_to :article

  validates :commenter, presence: true
  validate :validate_comenter
  validates :body, presence: true, length: { in: 6..500 }

  def validate_comenter
    errors.add(:commenter, :invalid) unless commenter=~ EMAIL_REGEXP
  end
end
