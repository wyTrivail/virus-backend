class Advisement < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
end
