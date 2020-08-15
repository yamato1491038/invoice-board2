class Result < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.search(search)
    if search[:month].to_i >= 10
      Result.where(user_id: "#{search[:user_id]}").where('created_at LIKE(?)', "#{search[:year]}-#{search[:month]}-%" )
    else
      Result.where(user_id: "#{search[:user_id]}").where('created_at LIKE(?)', "#{search[:year]}-0#{search[:month]}-%" )
    end
  end
end
