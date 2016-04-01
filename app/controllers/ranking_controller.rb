class RankingController < ApplicationController
  def ranking_have
    @items = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys 
    @ranking_have_items = Item.find(@items).sort_by{|o| @items.index(o.id)}
    render 'ranking_have' 
  end
  
  def ranking_want
    items = Want.group(:item_id).order('count_id desc').limit(10).count(:id) 
    @ranking_want_items = items.transform_keys!{ |key| Item.find(key) }
    render 'ranking_want' 
  end
  
end
