class Survey::Question < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # acceptable_attributes :image
  #
  # validates :image, :presence => true, :allow_blank => false

end
