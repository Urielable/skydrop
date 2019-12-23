class ProcessTagAction
  def self.execute(label)
    f = FedexService::Request.new()
    fedex_info = f.tracking_number label[:tracking_number]
    if fedex_info != nil 
      fedex_params = {
        height: fedex_info.details[:package_dimensions][:height],
        width: fedex_info.details[:package_dimensions][:width],
        length: fedex_info.details[:package_dimensions][:length],
        mass_unit: fedex_info.details[:package_dimensions][:units]
      }
      label_params = {
        height: label[:parcel][:height],
        width: label[:parcel][:width],
        length: label[:parcel][:length],
        mass_unit: label[:parcel][:mass_unit]
      }
      fedex_vweight = self.volumetric_weight fedex_params
      label_vweight = self.volumetric_weight label_params
      label_aweight = label[:parcel][:weight].ceil
      higher_label_weight = label_vweight < label_aweight ? label_aweight : label_vweight
      overweight = higher_label_weight - fedex_vweight > 0 ? false : true
      label.merge!(
        {
          overweight: overweight, 
          fedex_volumetric_weight: fedex_vweight,
          higher_label_weight: higher_label_weight,
          tag_processed: true
        })
    else
      label.merge!(
        {
          overweight: nil, 
          fedex_volumetric_weight: nil,
          higher_label_weight: nil,
          tag_processed: false
        }
      )
    end
    label
  end

  def self.volumetric_weight params = {}
    height = params.fetch(:height, "0").to_f
    width = params.fetch(:width, "0").to_f
    length = params.fetch(:length, "0").to_f
    mass_unit = params.fetch(:mass_unit, "0")
    in_to_cm = 2.54
    m = if mass_unit == 'IN' 
      (width*in_to_cm)*(height*in_to_cm)*(length*in_to_cm)/5000 
    else
      (width*height*length)/5000
    end
    m.ceil
  end
end
