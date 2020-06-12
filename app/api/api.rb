class API < Grape::API
  prefix 'api'
  format :json
  mount Acme::Report
end
