class Category < ApplicationRecord
  has_many :que_cate_relations, dependent: :destory
  has_many :questions, through: :que_cate_relations
end
