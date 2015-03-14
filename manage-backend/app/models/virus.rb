class Virus < ActiveRecord::Base
    after_initialize :init
    def init
        self.virus_type ||= 0
        self.platform ||= 0
    end
    mount_uploader :avatar, AvatarUploader
    #attr_accessible :pic_url, :asset_cache, :remove_asset

end
