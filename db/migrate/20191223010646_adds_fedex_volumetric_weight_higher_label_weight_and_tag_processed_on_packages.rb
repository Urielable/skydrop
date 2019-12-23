class AddsFedexVolumetricWeightHigherLabelWeightAndTagProcessedOnPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :fedex_volumetric_weight, :decimal, default: nil
    add_column :packages, :higher_label_weight, :decimal, default: nil
    add_column :packages, :tag_processed, :boolean, default: false
  end
end
