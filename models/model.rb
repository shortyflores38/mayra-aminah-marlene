require 'json'
# require 'yelp'
require 'http'
require 'optparse'




# Place holders for Yelp Fusion's OAuth 2.0 credentials. Grab them
# from https://www.yelp.com/developers/v3/manage_app
CLIENT_ID = "zIReGNNX_JUrNTHXFvmd6A"
CLIENT_SECRET = "3z7eEXqt3kFJOBFtXqDLftUZtHeo1WvvDoopMjyEMVDoPWj5nhuyrIF4NynSsaj5"


# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
TOKEN_PATH = "/oauth2/token"
GRANT_TYPE = "client_credentials"


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 5


# Make a request to the Fusion API token endpoint to get the access token.
# 
# host - the API's host
# path - the oauth2 token path
#
# Examples
#
#   bearer_token
#   # => "Bearer some_fake_access_token"
#
# Returns your access token
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


# Make a request to the Fusion search endpoint. Full documentation is online at:
# https://www.yelp.com/developers/documentation/v3/business_search
#
# term - search term used to find businesses
# location - what geographic location the search should happen
#
# Examples
#
#   search("burrito", "san francisco")
#   # => {
#          "total": 1000000,
#          "businesses": [
#            "name": "El Farolito"
#            ...
#          ]
#        }
#
#   search("sea food", "Seattle")
#   # => {
#          "total": 1432,
#          "businesses": [
#            "name": "Taylor Shellfish Farms"
#            ...
#          ]
#        }
#
# Returns a parsed json object of the request
def search(term, location)
 url = "#{API_HOST}#{SEARCH_PATH}"
 params = {
   term: term,
   location: location,
   limit: SEARCH_LIMIT
 }

 response = HTTP.auth(bearer_token).get(url, params: params)
data1=response.parse["businesses"][0]["name"]
data2=response.parse["businesses"][1]["name"]
data3=response.parse["businesses"][2]["name"]
data4=response.parse["businesses"][3]["name"]
data5=response.parse["businesses"][4]["name"]


data6=response.parse["businesses"][0]["location"]
location1=data6["display_address"]

data7=response.parse["businesses"][1]["location"]
location2=data7["display_address"]

data8=response.parse["businesses"][2]["location"]
location3=data8["display_address"]

data9=response.parse["businesses"][3]["location"]
location4=data9["display_address"]

data10=response.parse["businesses"][4]["location"]
location5=data10["display_address"]

data10=response.parse["businesses"][4]["location"]
location5=data10["display_address"]


data11=response.parse["businesses"][0]["display_phone"]
data12=response.parse["businesses"][1]["display_phone"]
data13=response.parse["businesses"][2]["display_phone"]
data14=response.parse["businesses"][3]["display_phone"]
data15=response.parse["businesses"][4]["display_phone"]

data21=response.parse["businesses"][0]["rating"]
data22=response.parse["businesses"][1]["rating"]
data23=response.parse["businesses"][2]["rating"]
data24=response.parse["businesses"][3]["rating"]
data25=response.parse["businesses"][4]["rating"]

data31=response.parse["businesses"][0]["image_url"]
data32=response.parse["businesses"][1]["image_url"]
data33=response.parse["businesses"][2]["image_url"]
data34=response.parse["businesses"][3]["image_url"]
data35=response.parse["businesses"][4]["image_url"]

[[data1,data21,data11,location1,data31],[data2,data22,data12,location2,data32],[data3,data23,data13,location3,data33],[data4,data24,data14,location4,data34],[data5,data25,data15,location5,data35]]

end


# def coffee_shop(location)
   
#     if location=="los angeles"
#         puts "Starbucks"
         
#     elsif location=="san francisco"
#         puts "Hiccups"
          
#     elsif location=="san jose"
#         puts "Dunkin Donuts"
         
#     else 
#         "City not available"
#     end
# end
# #  puts coffee_shop(answer)


