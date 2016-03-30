class RankingController < ApplicationController
  def ranking_have
    items = Have.group(:item_id).order('count_id desc').limit(10).count(:id) 
    @ranking_have_items = items.transform_keys!{ |key| Item.find(key) }
    render 'ranking_have' 
  end
  
  def ranking_want
    @items = Item.all.order("type DESC").limit(10)
    render 'ranking_want' 
  end
  
end
