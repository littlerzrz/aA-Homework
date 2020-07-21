# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  video_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
    validates :liker_id, :video_id, presence:true
    belongs_to :video, class_name: "Video", foreign_key: "video_id"
    belongs_to :liker, class_name: "User", foreign_key: "liker_id"
    
end
