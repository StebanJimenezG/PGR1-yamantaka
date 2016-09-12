class FormaDePago < ActiveRecord::Base
  has_many :receipts
end
