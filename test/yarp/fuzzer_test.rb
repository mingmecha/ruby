# frozen_string_literal: true

require_relative "test_helper"

module YARP
  # These tests are simply to exercise snippets found by the fuzzer that caused invalid memory access.
  class FuzzerTest < Test::Unit::TestCase
    def self.snippet(name, source)
      define_method(:"test_fuzzer_#{name}") { YARP.dump(source) }
    end

    snippet "incomplete global variable", "$"
    snippet "incomplete symbol", ":"
    snippet "incomplete escaped string", '"\\'
    snippet "trailing comment", "1\n#\n"
    snippet "comment followed by whitespace at end of file", "1\n#\n "
    snippet "trailing asterisk", "a *"
    snippet "incomplete decimal number", "0d"
    snippet "incomplete binary number", "0b"
    snippet "incomplete octal number", "0o"
    snippet "incomplete hex number", "0x"
    snippet "incomplete escaped list", "%w[\\"
    snippet "incomplete escaped regex", "/a\\"
    snippet "unterminated heredoc with unterminated escape at end of file", "<<A\n\\"
  end
end