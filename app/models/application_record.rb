class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_all(params)
    self.where(params).order('id')
  end

end
