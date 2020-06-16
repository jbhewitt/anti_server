class API < Grape::API
  prefix 'api'
  format :json
  mount Acme::Report
  mount Acme::File
  mount Acme::Screenshot
end
