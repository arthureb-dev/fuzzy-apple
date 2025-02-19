class Article < ApplicationRecord
  validates_presence_of :title, :content, :author, :category, :published_at
  validates :title, length: { maximum: 40 }
  validate :published_at_is_valid_date?

  scope :latest, -> { order(published_at: :desc) }

  private

  def published_at_is_valid_date?
    unless published_at.is_a?(Date)
      errors.add(:published_at, 'must be a valid date in format: YYYY-MM-DD')
    end
  end
end
