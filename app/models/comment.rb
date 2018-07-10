class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    binding.pry
    !user_attributes[:username].blank? ? self.user = User.create(username: user_attributes[:username]) : self.user = User.find(self[:user_id])
  end
end
