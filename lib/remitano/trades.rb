require_relative "collection"
module Remitano
  class Trades < Remitano::Collection
    def active(buy_or_sell, page: nil)
      options = { trade_type: buy_or_sell, trade_status: "active" }
      (options[:page] = page) if page
      Remitano::Net.get("/trades?#{options.to_query}").execute
    end

    def closed(buy_or_sell, page: nil)
      options = { trade_type: buy_or_sell, trade_status: "closed" }
      (options[:page] = page) if page
      Remitano::Net.get("/trades?#{options.to_query}").execute
    end

    def release(trade_ref)
      ac = Remitano::Net.post("/trades/#{trade_ref}/release").execute
      if Remitano.authenticator_secret.present?
        puts "Submitting token"
        Remitano::Net.post("/action_confirmations/#{ac.id}/confirm", token: Remitano.authenticator_token).execute
      end
    end

    def dispute(trade_ref)
      Remitano::Net.post("/trades/#{trade_ref}/dispute").execute
    end

    def mark_as_paid(trade_ref)
      Remitano::Net.post("/trades/#{trade_ref}/mark_as_paid").execute
    end

    def get(id)
      Remitano::Net.get("/trades/#{id}").execute.trade
    end

    def cancel(id)
      Remitano::Net.post("/trades/#{id}/cancel").execute
    end
  end
end
