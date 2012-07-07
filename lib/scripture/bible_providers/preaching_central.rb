#require 'httparty'
#require_relative 'base'
require 'scripture/bible_providers/base'

module Scripture
  module BibleProvider
    # Public: Interact with api.preachingcentral.com to provide bible
    # verses
    #
    # Examples
    #   @bible_provider = Scripture::BibleProvider::PreachingCentral.new
    #   @bible_provider.get_for_display('John 3:16')
    #   # => "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life."
    class PreachingCentral < Base
      include HTTParty

      # Public: Initialize the object and set the url
      def initialize
        @url = 'http://api.preachingcentral.com/'
      end

      # Internal: Search for a verse
      #
      # verse - A string containing the verse reference
      #
      # Returns the verse content
      def search_for(verse)
        @query = {
          "passage" => verse
        }

        @results = self.class.get("#{@url}bible.php?", :query => @query)

        @item = @results.parsed_response['bible']['range']['item']

        if @item.is_a? Array
          @text = @item.map do |item| 
            "#{item['verse']} #{item['text']} \n"
          end.join('')
        else
          @text = @item['text']
        end

        @text
      end

      # Public: Get a verse
      #
      # verse - The verse to get
      #
      # Returns the verse formatted with self.format
      def get(verse)
        self.class.format(super)
      end

      # Public: Get a verse to display
      #
      # verse - The verse to get
      #
      # Returns the verse formatted with self.format_for_display
      def get_for_display(verse)
        self.class.format_for_display(super)
      end

      # Internal: Format a verse
      #
      # verse - The verse to format
      #
      # Returns the formatted verse
      def self.format(verse)
        verse.gsub(/\n/, '<br />')
      end

      # Internal: Format a verse for display
      #
      # verse - The verse to format
      #
      # Returns the formatted verse
      def self.format_for_display(verse)
        verse.gsub('<br />', "\n")
      end
    end
  end
end
