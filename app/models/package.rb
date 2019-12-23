class Package < ApplicationRecord
  belongs_to :parcel

  scope :package_info, ->(){
    select(:id, :tracking_number, :carrier, :overweight, :fedex_volumetric_weight, :higher_label_weight, :tag_processed)
  }

  scope :parcel_info, ->(){
    select(:length, :width, :height, :weight, :distance_unit, :mass_unit)
    .joins(:parcel)
  }

  def self.packages_info params = {}
    package_id = params.fetch(:id, nil)
    packages = Package.package_info
              .parcel_info
              .find_by_id(package_id)
  end

end
