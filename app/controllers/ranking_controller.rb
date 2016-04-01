class RankingController < ApplicationController
  def ranking_have
    @item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys 
    @ranking_have_items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
    render 'ranking_have' 
  end
  
  def ranking_want
    @item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys 
    @ranking_want_items = Item.find(@item_ids).sort_by{|o| @item_ids.index(o.id)}
    render 'ranking_want' 
  end
  
end
