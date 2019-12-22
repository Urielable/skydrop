# -*- encoding : utf-8 -*-
module FedexService
  class Request
    def initialize
      @fedex = Fedex::Shipment.new(:key => Rails.application.secrets.fedex_key ,
              :password => Rails.application.secrets.fedex_password ,
              :account_number => Rails.application.secrets.fedex_account_number ,
              :meter => Rails.application.secrets.fedex_meter ,
              :mode => Rails.application.secrets.fedex_mode)
    end

    def tracking_number tracking_number
      @fedex.track(:tracking_number => tracking_number).first rescue nil
    end
  end
end