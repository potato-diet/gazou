require "openssl"

module Gazou
  class Helpers
    ALPHABET = %w(
      a b c d e f g h i j k l m n o p q r s t u v w x y z
      A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    )

    def self.get_checksum(data : IO)
      digest = OpenSSL::Digest.new("SHA256")
      digest << data
      digest.hexdigest
    end

    def self.randomize_filename(filename : String)
      ALPHABET.sample(5).join + File.extname(filename)
    end
  end
end
