# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 250 }
  # validacje, nazwa pola (kolumny) i wszystkie kryteria i tak dla kazdej
  # kolumny
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  has_one_attached :image

  def tags=(obj)
    if obj.is_a?(String)
      super sanitize_tags(obj)
    else
      super
    end
  end

private

  def sanitize_tags(text)
    text.split.map(&:downcase).uniq
  end

end
