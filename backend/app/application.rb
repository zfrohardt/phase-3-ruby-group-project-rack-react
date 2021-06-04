require 'json'
require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path.match(/test/) 
    #   return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    if req.path.match(/spells/)
      spells = JSON.parse(Spell.all.to_json)
      spells.each do |spell|
        spell["classes"] = Spell.find(spell["id"]).characters.collect{ |c| c.name }
      end
      return [200, { 'Content-Type' => 'application/json' }, [ spells.to_json ]]
    elsif req.path.match(/classes/)
      return [200, { 'Content-Type' => 'application/json' }, [ Character.all.collect{ |c| c.name }.to_json ]]
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
