# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 250 }
  # validacje, nazwa pola (kolumny) i wszystkie kryteria i tak dla kazdej
  # kolumny
  has_many :comments, dependent: :destroy
end
