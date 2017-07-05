module Spaceship
  # This class is used to upload Digital files (Images, Videos, JSON files) onto the du-itc service.
  # Its implementation is tied to the tunes module (in particular using +AppVersion+ instances)
  class AnalyticsClient < Spaceship::Client #:nodoc:
    #####################################################
    # @!group Init and Login
    #####################################################

    def self.hostname
      "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/"
    end

    def get_data(id, start_time = Date.today - 30.day, end_time = Date.today)
      start_time = start_time.strftime('%Y-%m-%dT%H:%M:%SZ')
      end_time = end_time.strftime('%Y-%m-%dT%H:%M:%SZ')

      ids = [id]

      body = {"adamId":ids,"frequency":"DAY","measures":["units", "impressionsTotal", "pageViewCount", "iap", "sales", "payingUsers"],"group":nil,"dimensionFilters":[],"startTime":start_time,"endTime":end_time}

      response = request(:post) do |req|
        req.url "analytics/api/v1/data/time-series"
        req.body = body.to_json
        req.headers['Content-Type'] = 'application/json'
        req.headers['Cookie']         = cookie
        req.headers['Host']           = 'analytics.itunes.apple.com'
        req.headers['Origin']         = 'https://analytics.itunes.apple.com'
        req.headers['Referer']        = 'https://analytics.itunes.apple.com/'
        req.headers['X-Requested-By'] = 'analytics.itunes.apple.com'
      end

      response.body
    end

    def send_login_request(user, password)
      send_shared_login_request(user, password)
    end
  end
end
