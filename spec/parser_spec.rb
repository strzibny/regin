require 'reginald'

describe Reginald::Parser do
  it "should parse slashes" do
    Reginald.parse(/\//).first.should eql(char('/'))
    Reginald.parse(%r{/}).first.should eql(char('/'))
    Reginald.parse(%r{\/}).first.should eql(char('/'))
  end

  it "should parse escaped specials" do
    Reginald.parse(%r{\^}).first.should eql(char('^'))
    Reginald.parse(%r{\.}).first.should eql(char('.'))
    Reginald.parse(%r{\[}).first.should eql(char('['))
    Reginald.parse(%r{\]}).first.should eql(char(']'))
    Reginald.parse(%r{\$}).first.should eql(char('$'))
    Reginald.parse(%r{\(}).first.should eql(char('('))
    Reginald.parse(%r{\)}).first.should eql(char(')'))
    Reginald.parse(%r{\|}).first.should eql(char('|'))
    Reginald.parse(%r{\*}).first.should eql(char('*'))
    Reginald.parse(%r{\+}).first.should eql(char('+'))
    Reginald.parse(%r{\?}).first.should eql(char('?'))
    Reginald.parse(%r{\{}).first.should eql(char('{'))
    Reginald.parse(%r{\}}).first.should eql(char('}'))
    Reginald.parse(%r{\\}).first.should eql(char('\\'))
  end

  it "should parse characters" do
    Reginald.parse(%r{foo}).should == [
      char('f'),
      char('o'),
      char('o')
    ]
  end

  it "should parse character with quantifier" do
    Reginald.parse(%r{a*}).first.should eql(char('a', :quantifier => '*'))
    Reginald.parse(%r{a+}).first.should eql(char('a', :quantifier => '+'))
    Reginald.parse(%r{a?}).first.should eql(char('a', :quantifier => '?'))
    Reginald.parse(%r{a?}).first.should eql(char('a', :quantifier => '?'))
    Reginald.parse(%r{a{3}}).first.should eql(char('a', :quantifier => '{3}'))
    Reginald.parse(%r{a{3,4}}).first.should eql(char('a', :quantifier => '{3,4}'))
  end

  it "should parse anchors" do
    Reginald.parse(%r{^foo}).should eql(expr([
      anchor('^'),
      char('f'),
      char('o'),
      char('o')
    ]))

    Reginald.parse(%r{\Afoo}).should eql(expr([
      anchor('\A'),
      char('f'),
      char('o'),
      char('o')
    ]))

    Reginald.parse(%r{foo$}).should eql(expr([
      char('f'),
      char('o'),
      char('o'),
      anchor('$')
    ]))

    Reginald.parse(%r{foo\Z}).should eql(expr([
      char('f'),
      char('o'),
      char('o'),
      anchor('\Z')
    ]))
  end

  it "should parse wild card range" do
    Reginald.parse(%r{f..k}).should eql(expr([
      char('f'),
      range('.'),
      range('.'),
      char('k')
    ]))

    result = Reginald.parse(%r{f..k})
    result[0].should include('f')
    result[0].should_not include('F')
    result[1].should include('u')
    result[2].should include('c')
    result[3].should include('k')
  end

  it "should parse digit range" do
    Reginald.parse(%r{\ds}).should == [range('\d'), char('s')]
  end

  it "should parse bracket expression" do
    Reginald.parse(%r{[a-z]}).first.should eql(range('a-z'))
    Reginald.parse(%r{[0-9]}).first.should eql(range('0-9'))
    Reginald.parse(%r{[abc]}).first.should eql(range('abc'))
  end

  it "should parse bracket expression with special characters" do
    Reginald.parse(%r{/foo/([^/.?]+)}).should == [
      char('/'),
      char('f'),
      char('o'),
      char('o'),
      char('/'),
      group([range('/.?', :negate => true, :quantifier => '+')], :index => 0)
    ]
  end

  it "should parse negated bracket expression" do
    Reginald.parse(%r{[^abc]}).first.should eql(range('abc', :negate => true))
    Reginald.parse(%r{[^/\.\?]}).first.should eql(range('/.?', :negate => true))
  end

  it "should parse bracket expression with quantifier" do
    Reginald.parse(%r{[a-z]+}).should == [range('a-z', :quantifier => '+')]
  end

  it "should parse group" do
    Reginald.parse(%r{/foo(/bar)}).should == [
      char('/'),
      char('f'),
      char('o'),
      char('o'),
      group([
        char('/'),
        char('b'),
        char('a'),
        char('r')
      ], :index => 0)
    ]
  end

  it "should parse group with quantifier" do
    Reginald.parse(%r{/foo(/bar)?}).should == [
      char('/'),
      char('f'),
      char('o'),
      char('o'),
      group([
        char('/'),
        char('b'),
        char('a'),
        char('r')
      ], :quantifier => '?', :index => 0)
    ]
  end

  it "should parse ignorecase option" do
    re = Reginald.parse(/abc/i)
    re.should be_casefold
  end

  it "should parse extend expression" do
    re = /     # foo
           bar # baz
         /x
    Reginald.parse(re)
  end

  it "should parse noncapture group" do
    Reginald.parse(%r{/foo(?:/bar)}).should == [
      char('/'),
      char('f'),
      char('o'),
      char('o'),
      group([
        char('/'),
        char('b'),
        char('a'),
        char('r')
      ], :capture => false)
    ]
  end

  if Reginald.regexp_supports_named_captures?
    it "should parse named group" do
      regexp = eval('%r{/foo(?<bar>baz)}')

      Reginald.parse(regexp).should == [
        char('/'),
        char('f'),
        char('o'),
        char('o'),
        group([
          char('b'),
          char('a'),
          char('z')
        ], :name => 'bar', :index => 0)
      ]
    end

    it "should parse nested named group" do
      regexp = eval('%r{a((?<b>c))?}')

      Reginald.parse(regexp).should == [
        char('a'),
        group([
          group([char('c')], :name => 'b', :index => 1)
        ], :quantifier => '?', :index => 0)
      ]
    end
  end

  private
    def anchor(value)
      Reginald::Anchor.new(value)
    end

    def char(value, options = {})
      char = Reginald::Character.new(value)
      options.each { |k, v| char.send("#{k}=", v) }
      char
    end

    def range(value, options = {})
      range = Reginald::CharacterRange.new(value)
      options.each { |k, v| range.send("#{k}=", v) }
      range
    end

    def expr(ary, options = {})
      expression = Reginald::Expression.new(ary)
      options.each { |k, v| expression.send("#{k}=", v) }
      expression
    end

    def group(value, options = {})
      group = Reginald::Group.new(value)
      options.each { |k, v| group.send("#{k}=", v) }
      group
    end
end
