class Result < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.search(search)
    search_time = "#{search[:year]}-#{search[:month]}-01"
    Result.where(user_id: "#{search[:user_id]}").where(created_at: search_time.in_time_zone.all_month)
    
    #if search[:month].to_i >= 10
    #  Result.where(user_id: "#{search[:user_id]}").where('created_at: LIKE(?)', "#{search[:year].to_i}-#{search[:month].to_i}-%" )
    #else
    #  Result.where(user_id: "#{search[:user_id]}").where('created_at: LIKE(?)', "#{search[:year].to_i}-0#{search[:month].to_i}-%" )
    #end
  end
end
