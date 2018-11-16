class LegacyBook < ActiveRecord::Base
  self.primary_key = "isbn"
end
