class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
   paginates_per 5
end
