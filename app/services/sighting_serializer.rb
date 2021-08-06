class SightingSerializer

    def initialize(sighting_object)
        @sighting = sighting_object
    end
    
    # initial method that we refactored by organizing options below
    # def to_serialized_json
    #     @sighting.to_json(:include => {
    #       :bird => {:only => [:name, :species]},
    #       :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    # end

    # organizing options
    # we are passing multiple options into to_son when it is called 
    # these options are just key/value pairs in a hash
    # we define a variable, options, assigning it to a hash 
    # we then define two keys on that hash, :inclue and :except, and assign them the same values as before
    # finally at the end we pass in the options hash
    def to_serialized_json
        options = {
          include: {
            bird: {
              only: [:name, :species]
            },
            location: {
              only: [:latitude, :longitude]
            }
          },
          except: [:updated_at],
        }
        @sighting.to_json(options)
      end
end