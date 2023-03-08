class Genre < ApplicationRecord

  # validates :name, presence: true
  has_many :items, dependent: :destroy, foreign_key: :genre, primary_key: :genre

end
