# coding: utf-8

module WebID
  # Abstraction of a WebID identity
  class ID
    attr_reader :id_hashtag
    attr_reader :profile_uri

    # Creates a new ID instance when supplied with a Web ID URI string.
    # @param uri_string [String] the WebID URI for the ID instance
    # @return [WebID::ID]
    def initialize(uri_string)
      set_defaults(uri_string)
    end

    # @return [String] the full URI to the person/agent identifier
    def uri
      return @profile_uri if @id_hashtag.empty?
      "#{@profile_uri}/##{@id_hashtag}"
    end

    private

    def set_defaults(uri_string)
      split_regex = /\/#/
      @profile_uri, @id_hashtag = if uri_string =~ split_regex
                                    uri_string.split('/#')
                                  else
                                    [uri_string.chomp('/'), '']
                                  end
    end
  end
end
