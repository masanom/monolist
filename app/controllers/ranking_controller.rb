class RankingController < ApplicationController
  def ranking_have
    @items = Item.all.order("have DESC").limit(30)
    #render ranking_have
    
  end
  
  def ranking_want
  end
  
end
