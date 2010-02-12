# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_r3wi_session',
  :secret => '90b49dafa04380b5491db7b0509e7cc0c067b0efadaab93701ed89c7392c5f407984bf850a1ef98d55507f9c4191faecff469ddaf1856443b3737b8463b01a99'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
