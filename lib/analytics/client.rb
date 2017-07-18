module Spaceship
  # This class is used to upload Digital files (Images, Videos, JSON files) onto the du-itc service.
  # Its implementation is tied to the tunes module (in particular using +AppVersion+ instances)
  class AnalyticsClient < Spaceship::Client #:nodoc:
    #####################################################
    # @!group Init and Login
    #####################################################

    def self.hostname
      "https://analytics.itunes.apple.com/"
    end

    def get_units(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'units'
      get_data(id, measure, start_time, end_time)
    end

    def get_page_view_count(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'pageViewCount'
      get_data(id, measure, start_time, end_time)
    end

    def get_iap(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'iap'
      get_data(id, measure, start_time, end_time)
    end

    def get_sales(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'sales'
      get_data(id, measure, start_time, end_time)
    end

    def get_paying_users(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'payingUsers'
      get_data(id, measure, start_time, end_time)
    end

    def get_impressions_total(id, start_time = Date.today - 30.day, end_time = Date.today)
      measure = 'impressionsTotal'
      get_data(id, measure, start_time, end_time)
    end

    def get_data(id, measure, start_time, end_time)
      start_time = start_time.strftime('%Y-%m-%dT%H:%M:%SZ')
      end_time = end_time.strftime('%Y-%m-%dT%H:%M:%SZ')

      ids = [id]

      body = { 
        "adamId": ids, 
        "frequency": "DAY", 
        "measures": [measure],
        "group": nil, 
        "dimensionFilters": [], 
        "startTime": start_time, 
        "endTime": end_time 
      }

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
