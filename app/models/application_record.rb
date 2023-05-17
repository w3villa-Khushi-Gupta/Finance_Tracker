class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.primary_class
    true
  end
end
