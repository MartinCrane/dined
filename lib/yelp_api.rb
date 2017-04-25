require "json"
require "http"



module YelpAPI
    # Place holders for Yelp Fusion's OAuth 2.0 credentials. Grab them
    # from https://www.yelp.com/developers/v3/manage_app
    CLIENT_ID = ENV["yelp_app_id"]
    CLIENT_SECRET = ENV["yelp_secret"]


    # Constants, do not change these
    API_HOST = "https://api.yelp.com"
    SEARCH_PATH = "/v3/businesses/search"
    BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
    TOKEN_PATH = "/oauth2/token"
    GRANT_TYPE = "client_credentials"


    DEFAULT_BUSINESS_ID = "yelp-san-francisco"
    DEFAULT_TERM = "dinner"
    DEFAULT_LOCATION = "San Francisco, CA"
    SEARCH_LIMIT = 50



    def bearer_token
      # Put the url together
      url = "#{API_HOST}#{TOKEN_PATH}"

      raise "Please set your CLIENT_ID" if CLIENT_ID.nil?
      raise "Please set your CLIENT_SECRET" if CLIENT_SECRET.nil?

      # Build our params hash
      params = {
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET,
        grant_type: GRANT_TYPE
      }
      response = HTTP.post(url, params: params)
      parsed = response.parse
      "#{parsed['token_type']} #{parsed['access_token']}"
    end

    def search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
        term: term,
        location: location,
        limit: SEARCH_LIMIT
      }
      response = HTTP.auth(bearer_token).get(url, params: params)
      response.parse
    end

    def customSearch(token)

      url = "#{API_HOST}#{SEARCH_PATH}"
      params = token
      response = HTTP.auth(bearer_token).get(url, params: params)
      response.parse
    end

    def business(business_id)
      url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
      response = HTTP.auth(bearer_token).get(url)
      response.parse
    end


end
