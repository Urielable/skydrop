class SavePackageAction
  def self.execute(item)
    package = Package.new(:tracking_number=>item[:tracking_number], 
                          :carrier=>item[:carrier],
                          :overweight=>item[:overweight],
                          :fedex_volumetric_weight => item[:fedex_volumetric_weight],
                          :higher_label_weight => item[:higher_label_weight],
                          :tag_processed => item[:tag_processed])
    parcel = Parcel.new(item[:parcel])
    package.parcel = parcel
    package.save
  end
end
