class Survey < ApplicationRecord
    has_many :items, dependent: :destroy
    accepts_nested_attributes_for :items

    has_many :free_texts, dependent: :destroy
end
