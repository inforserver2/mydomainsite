class Binary < ActiveRecord::Base
  has_many :sponsored, class_name: "Binary",
                          foreign_key: "sponsor_id"
  belongs_to :sponsor, class_name: "Binary"
#  validates :my_side, inclusion: { in: %w(left right)}
#  validates :sponsor_id, numericality: { only_integer: true }
#
#  def self.setup sponsor,side
#    create(sponsor_id:sponsor.id, myside:side)
#  end
#
#  scope :sponsored_left, -> { sponsored.where(side:'left').take }
#  scope :sponsored_right, -> { sponsored.where(side:'right').take }
#
#
#  private
#
#  def position_availability? sponsor, side
#    sponsor.sponsored.where(side: side).exists?
#  end



end
