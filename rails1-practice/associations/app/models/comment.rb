# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  video_id     :integer          not null
#  parent_comment_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#

class Comment < ApplicationRecord
    validates :body, :video_id, :commenter_id, presence: true
    # validates :parent_comment_id, optional:true

    belongs_to :commenter, class_name: "User", foreign_key: "commenter_id"
    belongs_to :video, class_name: "Video", foreign_key: "video_id"
    
    belongs_to :parent_comment, class_name: "Comment", foreign_key: "parent_comment_id", primary_key: :id, optional:true
    
        has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id"

    has_one :parent_commenter, through: :parent_comment, source: :commenter
    
end