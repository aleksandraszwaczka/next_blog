class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
    validates :text, presence: true
    #validacje, nazwa pola (kolumny) i wszystkie kryteria i tak dla każdej kolumny
    validates_uniqueness_of :title, :text
end
