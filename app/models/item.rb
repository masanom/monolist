class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships

  has_many :wants, class_name:"Want", foreign_key: "item_id", dependent: :destroy
  has_many :want_users, through: :wants, source: :user
  
  has_many :haves, class_name:"Have", foreign_key: "item_id", dependent: :destroy
  has_many :have_users, through: :haves, source: :user
  
  
  
  def have(user)
    haves.create(user_id: user.id)
  end

  def unhave(user)
    haves.find_by(user_id: user.id).destroy
  end

  def have?(user)
    have_items.include?(user)
  end

  def want(user)
    wants.create(user_id: user.id)
  end

  def unwant(user)
    wants.find_by(user_id: user.id).destroy
  end

  def want?(user)
    want_items.include?(user)
  end
  
end
