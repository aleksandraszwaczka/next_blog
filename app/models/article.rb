# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :text, presence: true, length: { maximum: 250 }
  # validacje, nazwa pola (kolumny) i wszystkie kryteria i tak dla kazdej
  # kolumny
  validates_uniqueness_of :title, :text
end
