require 'sequel'

class Dummy < Sequel::Model

  plugin :json_serializer

end
