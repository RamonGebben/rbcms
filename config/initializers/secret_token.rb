# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = 'a3b12de8658c5a6a2ecc2bb2c5fbf3b0e65d99a98a850ff8126d53b5b836980e6ea71aeed4585be7b3dc4710959cf58b7a0713b108009162a49550eb3ecda4d8'
