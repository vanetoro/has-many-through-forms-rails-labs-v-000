class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def category_ids=(ids)
       ids.each do |id|
         if !id.blank?
           self.categories << Category.find(id)
           self.save
         end
       end
  end

  def categories_attributes=(cat_attr)
    !cat_attr.empty? ? self.categories << Category.create(name: cat_attr)
  end
end
