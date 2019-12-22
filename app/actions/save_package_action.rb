class SavePackageAction
  def self.execute(item)
    p '-+-+-+-+-+-+-+-+'
    p item
    p '-+-+-+-+-+-+-+-+'
    package = Package.new(:tracking_number=>item[:tracking_number], 
                          :carrier=>item[:carrier],
                          :overweight=>item[:overweight])
    parcel = Parcel.new(item[:parcel])
    package.parcel = parcel
    package.save
  end
end
