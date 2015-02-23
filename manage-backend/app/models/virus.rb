class Virus < ActiveRecord::Base
    after_initialize :init
    def init
        self.virus_type ||= 0
        self.platform ||= 0
    end
end
