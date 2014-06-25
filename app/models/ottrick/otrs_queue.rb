module Ottrick
  class OtrsQueue < ActiveRecord::Base
    # -- associations
    has_many :tickets

    # -- configuration
    # -- validations and callbacks
    validates :name, :presence => true, :uniqueness => true

    def to_s
      name
    end
  end
end
