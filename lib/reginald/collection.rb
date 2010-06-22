module Reginald
  class Collection
    include Enumerable

    def initialize(*args)
      @array = Array.new(*args)
    end

    def each(&block)
      @array.each(&block)
    end

    def [](i)
      @array[i]
    end

    def length
      @array.length
    end
    alias_method :size, :length

    # TODO: Deprecate
    def <<(obj)
      @array << obj
    end

    # TODO: Deprecate
    def first
      @array.first
    end

    # TODO: Deprecate
    def last
      @array.last
    end

    def to_regexp
      Regexp.compile("\\A#{to_s(true)}\\Z", flags)
    end

    def match(char)
      to_regexp.match(char)
    end

    def include?(char)
      any? { |e| e.include?(char) }
    end

    def ==(other) #:nodoc:
      case other
      when String
        other == to_s
      when Array
        other == @array
      else
        eql?(other)
      end
    end

    def eql?(other) #:nodoc:
      other.instance_of?(self.class) && @array.eql?(other.internal_array)
    end

    def freeze #:nodoc:
      each { |e| e.freeze }
      @array.freeze
      super
    end

    protected
      def internal_array #:nodoc:
        @array
      end

      def extract_options(args)
        if args.last.is_a?(Hash)
          return args[0..-2], args.last
        else
          return args, {}
        end
      end
  end
end
