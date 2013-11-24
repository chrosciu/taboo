class Setting < ActiveRecord::Base

  validates_inclusion_of :timeout, in: [30, 60, 90, 120], message: 'Can be only one of: 30, 60, 90, 120'

  class << self

    def instance
      Setting.first_or_create
    end

  end
end
