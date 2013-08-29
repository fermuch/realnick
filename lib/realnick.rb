require 'realnick/version'
require 'open-uri'
require 'json'
require 'nokogiri'
require 'realnick/utils'


module Realnick
  class << self

    # Main method. With this you fetch a nick based on the method.
    # Available methods: popular_anime, top_anime, upcoming_anime, just_added_anime
    def fetch(method = 'popular_anime')
      methods = ['popular_anime', 'top_anime', 'upcoming_anime']
      raise ArgumentError, 'method not found' unless methods.include? method

      case method
      when 'top_anime'
        @url = 'http://mal-api.com/anime/top'
      when 'popular_anime'
        @url = 'http://mal-api.com/anime/popular'
      when 'upcoming_anime'
        @url = 'http://mal-api.com/anime/upcoming'
      end

      anime = JSON.parse(open(@url).read).sample
      url = URI::encode("http://myanimelist.net/anime/#{anime['id']}/#{anime['title']}/characters")

      characters = parse_characters(url)

      # randomize a little more by adding a suffix
      characters.shuffle.map{ |c|
        c << ["", "-san", "-sama", "-sensei"].sample
      }
    end

    private
      # parse characters from MyAnimeList
      def parse_characters(url)
        #@search = 'td[class="borderClass bgColor2"]'
        @search = 'div[style="padding: 0 7px;"] td[width="27"] a img'
        d = Nokogiri::HTML(open(url).read)
        d.css(@search).map do |c|
          c.attribute('alt').to_s.split(/(?:\s*(?:,|\s|\')\s*)+/).shuffle.join("-").downcase
        end
      end

  end
end