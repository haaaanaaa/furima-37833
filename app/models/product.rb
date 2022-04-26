class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :derively_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  has_one_attached :image

  belongs_to :user
  # has_one    :purchase

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :derively_fee_id
    validates :status_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    
  end

  with_options numericality: { other_than: 0, message: 'select' } do
    validates :category_id
    validates :shipping_day_id
    validates :derively_fee_id
    validates :prefecture_id
    validates :status_id
  end

  
  
 
 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
                  
end
