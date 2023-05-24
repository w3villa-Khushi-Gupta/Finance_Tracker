class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks , through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where( id: stock.id ).exists?

  end


  def under_count_limit
    stocks.count < 10
  end


  def can_track_stock?(ticker_symbol)
    under_count_limit && !stock_already_tracked?(ticker_symbol)
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

  def self.search(param)
    param.strip!
    to_send_back = (first_name_search(param) + last_name_search(param) + email_search(param)).uniq
    return nil unless to_send_back
    to_send_back
  end


  def self.first_name_search(param)
    decide_field_name("first_name",param)
  end
  
  def self.last_name_search(param)
    decide_field_name("last_name",param)
  end

  def self.email_search(param)
    decide_field_name("email",param)
  end
  
  def self.decide_field_name(field_name,param)
    where("#{field_name} like ?","%#{param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def not_friends_with?(friend_id)
    !self.friends.where(id: friend_id ).exists?
  end

end
