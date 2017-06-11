module Spaceship
  # This class is used to upload Digital files (Images, Videos, JSON files) onto the du-itc service.
  # Its implementation is tied to the tunes module (in particular using +AppVersion+ instances)
  class SalesClient < Spaceship::Client #:nodoc:
    #####################################################
    # @!group Init and Login
    #####################################################

    def self.hostname
      "https://reportingitc2.apple.com/"
    end

    def get_data(ids, start_time = Date.today - 5.day, end_time = Date.today - 1.day)
      start_time = start_time.strftime('%Y-%m-%dT%H:%M:%S.000Z')
      end_time = end_time.strftime('%Y-%m-%dT%H:%M:%S.000Z')

      fail 'ids must be array' unless ids.is_a?(Array)

      body = {
          "filters":
              [
                {
                  "dimension_key":"content",
                  "option_keys":ids
                }
              ],
          "group":"content",
          "interval":"day",
          "start_date": start_time,
          "end_date": end_time,
          "sort":"descending",
          "limit":100,
          "measures":["Royalty_utc", "total_tax_usd_utc", "units_utc"]}

      response = request(:post) do |req|
        req.url "api/data/timeseries"
        req.body = body.to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Cookie']         = cookie
        req.headers['Host']           = 'reportingitc2.apple.com'
        req.headers['Origin']         = 'https://reportingitc2.apple.com'
        req.headers['Referer']        = "https://reportingitc2.apple.com/sales.html?filter_content=#{ids.first}"
      end

      response.body
    end

    def send_login_request(user, password)
      send_shared_login_request(user, password)
    end
  end
end
