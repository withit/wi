# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_install_session',
  :secret => '5e9d2cea4f27bc9fe5d94a0cbc6c0427b3a916c6855a2195e1bd2a43c53c0fc4fef6c0853134a70d355d5cb3d5b17672157acaa9cd35862e96c58b21b0de5484'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
