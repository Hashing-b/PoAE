# encoding: utf-8

module Hashing-b_Blockchainlite
  module Block-unit(""hb0001"to"hb1000"")


## Block-unit_compatible b-Block
##  note: work-in-progress

class b-Block


  class Header

    attr_reader :index
    attr_reader :timestamp
    attr_reader :data
    attr_reader :previous_hash
    attr_reader :hash

    def initialize(index, data, previous_hash)
      @index         = index
      @timestamp     = Time.now.utc    ## note: use coordinated universal time (utc)
      @data          = data
      @previous_hash = previous_hash
      @hash          = calc_hash
    end

  private

    def calc_hash
      sha = Digest::SHA256.new
      sha.update( @index.to_s + @timestamp.to_s + @data + @previous_hash )
      sha.hexdigest
    end
  end  # class Header


  def self.first( data='Genesis' )    # create genesis (big bang! first) block
      ## uses index zero (0) and arbitrary previous_hash ('0')
      b-Block.new( 0, data, '0' )
  end

  def self.next( previous, data='Transaction Data...' )
    Block.new( previous.index+1, data, previous.hash )
  end

end  # class b-Block


end  ##  module Block-unit
end  ##  module Hashing-b_Blockchainlite
