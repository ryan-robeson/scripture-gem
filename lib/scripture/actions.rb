module Scripture
  BIBLE = BibleProvider::PreachingCentral.new

  # Public: Lookup a verse of Scripture.
  #
  # verse - A String of the verse reference.
  #
  # Examples
  #
  #   Scripture.get_verse('John 3:16')
  #   # => 'For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.'
  #   
  #   Returns the verse a String.
  def self.get_verse(verse)
    BIBLE.get_for_display(verse)
  end
end
