# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_raidmetrics_session',
  :secret      => 'f2069466ca0aca133c7cfb691dbc59c15c9b79c428ea4dec6135d79df73f1b7d0fed34c112afe349d2a49465fe99ccd8a2ac88979418a26ade91903cd53cc104'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
