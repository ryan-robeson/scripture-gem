module Scripture
  module BibleProvider
    # Public: Base class for BibleProvider. Should be inherited from and overridden.
    class Base
      # Public: Provides a Get method for the url of the BibleProvider
      attr_reader :url
      # Public: Provides a Get method for the path to the verse. Usually CSS Path.
      attr_reader :path_to_verse

      def initialize
      end

      # Internal: A Mechanize agent to browse pages
      #
      # Returns a Mechanize object
      def agent
        @agent = Mechanize.new unless @agent
        @agent.follow_meta_refresh = true
        @agent.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:7.0.1) Gecko/20100101 Firefox/7.0.1'
        @agent
      end

      # Public: The main page of the BibleProvider
      #
      # Returns the agent on the main page
      def main_page
        agent.get(@url)
      end

      # Internal: Searches for the verse. Must be overridden.
      # May be changed to a private method. get should be
      # used when acquiring a verse.
      #
      # verse - The verse to find.
      #
      # Returns the verse
      def search_for(verse)
        raise NotImplementedError, "#{self.class} does not implement #{__method__}"
      end

      # Public: Get a verse
      #
      # verse - The verse to get
      #
      # Returns the verse as a String
      def get(verse)
        @verse_text = search_for(verse)
      end

      # Public: Get a verse for display. Should be overridden for things
      # such as formatting.
      #
      # verse - The verse to get and display
      #
      # Returns the verse to display
      def get_for_display(verse)
        get(verse)
      end
    end
  end
end
