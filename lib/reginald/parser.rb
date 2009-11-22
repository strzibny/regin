#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'reginald/tokenizer'

module Reginald
  class Parser < Racc::Parser

attr_accessor :capture_index
attr_accessor :capture_index_stack
##### State transition tables begin ###

racc_action_table = [
     5,    63,    11,     6,     7,     9,    46,    10,    55,    14,
     5,    12,    11,     6,     7,     9,    47,    10,    57,    14,
     5,    12,    11,     6,     7,     9,    31,    10,    58,    14,
     5,    12,    11,     6,     7,     9,    28,    10,    37,    14,
     5,    12,    11,     6,     7,     9,    49,    10,    64,   nil,
     5,    12,    11,     6,     7,     9,    27,    10,   nil,   nil,
     5,    12,    11,     6,     7,     9,    13,    10,    14,   nil,
     5,    12,    11,     6,     7,     9,    19,    10,    39,    40,
   nil,    12,    17,    18,    20,    41,    43,    44,    45,    19,
    22,   nil,    24,    23,    25,    17,    18,    20,    48,   nil,
   nil,    34,    33,    35,    32,   nil,   nil,    34,    33,    35,
    61,    43,    44,    45,    53,    43,    44,    45,    43,    44,
    45,    43,    44,    45,    24,    23,    25,    43,    44,    45,
    43,    44,    45,    43,    44,    45,    43,    44,    45 ]

racc_action_check = [
     0,    55,     0,     0,     0,     0,    31,     0,    46,    50,
    49,     0,    49,    49,    49,    49,    31,    49,    50,    51,
     2,    49,     2,     2,     2,     2,    20,     2,    51,    26,
    40,     2,    40,    40,    40,    40,    13,    40,    26,    56,
    39,    40,    39,    39,    39,    39,    38,    39,    56,   nil,
    10,    39,    10,    10,    10,    10,    10,    10,   nil,   nil,
    14,    10,    14,    14,    14,    14,     1,    14,     1,   nil,
    29,    14,    29,    29,    29,    29,    15,    29,    27,    27,
   nil,    29,    15,    15,    15,    27,    27,    27,    27,     3,
     5,   nil,     5,     5,     5,     3,     3,     3,    36,   nil,
   nil,    36,    36,    36,    21,   nil,   nil,    21,    21,    21,
    54,    54,    54,    54,    42,    42,    42,    42,    60,    60,
    60,    41,    41,    41,    22,    22,    22,    59,    59,    59,
    52,    52,    52,    53,    53,    53,    61,    61,    61 ]

racc_action_pointer = [
    -3,    66,    17,    80,   nil,    85,   nil,   nil,   nil,   nil,
    47,   nil,   nil,    36,    57,    67,   nil,   nil,   nil,   nil,
    18,   100,   117,   nil,   nil,   nil,    27,    66,   nil,    67,
   nil,    -2,   nil,   nil,   nil,   nil,    94,   nil,    34,    37,
    27,   101,    95,   nil,   nil,   nil,     0,   nil,   nil,     7,
     7,    17,   110,   113,    91,   -17,    37,   nil,   nil,   107,
    98,   116,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
   -38,   -38,    -2,    -6,    -7,   -38,   -10,   -11,   -12,   -13,
   -38,   -24,   -25,   -38,   -38,    -4,    -5,   -26,   -27,   -28,
   -38,   -38,   -38,   -17,   -18,   -19,   -38,   -38,    68,    -1,
    -3,   -38,    -8,   -14,   -15,   -16,   -38,   -20,   -38,   -38,
   -38,   -38,   -38,   -35,   -36,   -37,   -38,   -30,    -9,   -38,
   -38,   -38,   -38,   -38,   -38,   -38,   -38,   -22,   -23,   -38,
   -38,   -38,   -34,   -29,   -21,   -31,   -32,   -33 ]

racc_goto_table = [
     1,    42,    15,    21,    38,    16,    29,   nil,   nil,   nil,
    26,   nil,   nil,   nil,   nil,    52,    54,    30,   nil,   nil,
    36,   nil,   nil,   nil,   nil,   nil,    59,    60,    62,    15,
   nil,   nil,   nil,    65,    66,    67,   nil,   nil,   nil,    50,
    51,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    56 ]

racc_goto_check = [
     1,     9,     3,     6,     8,     4,     2,   nil,   nil,   nil,
     1,   nil,   nil,   nil,   nil,     9,     9,     4,   nil,   nil,
     6,   nil,   nil,   nil,   nil,   nil,     9,     9,     9,     3,
   nil,   nil,   nil,     9,     9,     9,   nil,   nil,   nil,     1,
     1,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,    -8,     0,     2,   nil,    -2,   nil,   -23,   -26 ]

racc_goto_default = [
   nil,   nil,     2,     3,   nil,     4,   nil,     8,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 24, :_reduce_1,
  1, 24, :_reduce_2,
  3, 25, :_reduce_3,
  2, 25, :_reduce_4,
  2, 25, :_reduce_5,
  1, 25, :_reduce_none,
  1, 26, :_reduce_none,
  3, 26, :_reduce_8,
  4, 26, :_reduce_9,
  1, 26, :_reduce_10,
  1, 26, :_reduce_11,
  1, 26, :_reduce_12,
  1, 26, :_reduce_13,
  2, 29, :_reduce_14,
  2, 29, :_reduce_15,
  2, 29, :_reduce_16,
  1, 29, :_reduce_none,
  1, 29, :_reduce_none,
  1, 29, :_reduce_none,
  3, 28, :_reduce_20,
  6, 28, :_reduce_21,
  5, 28, :_reduce_22,
  5, 28, :_reduce_23,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  5, 27, :_reduce_29,
  3, 27, :_reduce_30,
  4, 31, :_reduce_31,
  4, 31, :_reduce_32,
  4, 31, :_reduce_33,
  3, 31, :_reduce_34,
  1, 32, :_reduce_35,
  1, 32, :_reduce_36,
  1, 32, :_reduce_37 ]

racc_reduce_n = 38

racc_shift_n = 68

racc_token_table = {
  false => 0,
  :error => 1,
  :BAR => 2,
  :LBRACK => 3,
  :RBRACK => 4,
  :L_ANCHOR => 5,
  :CHAR_CLASS => 6,
  :DOT => 7,
  :CHAR => 8,
  :QMARK => 9,
  :LPAREN => 10,
  :RPAREN => 11,
  :COLON => 12,
  :NAME => 13,
  :R_ANCHOR => 14,
  :STAR => 15,
  :PLUS => 16,
  :LCURLY => 17,
  :RCURLY => 18,
  :MINUS => 19,
  :MULTILINE => 20,
  :IGNORECASE => 21,
  :EXTENDED => 22 }

racc_nt_base = 23

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "BAR",
  "LBRACK",
  "RBRACK",
  "L_ANCHOR",
  "CHAR_CLASS",
  "DOT",
  "CHAR",
  "QMARK",
  "LPAREN",
  "RPAREN",
  "COLON",
  "NAME",
  "R_ANCHOR",
  "STAR",
  "PLUS",
  "LCURLY",
  "RCURLY",
  "MINUS",
  "MULTILINE",
  "IGNORECASE",
  "EXTENDED",
  "$start",
  "expression",
  "branch",
  "atom",
  "quantifier",
  "group",
  "bracket_expression",
  "anchor",
  "options",
  "modifier" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = Expression.new(Alternation.reduce(val[0], val[2])) 
    result
end

def _reduce_2(val, _values, result)
 result = Expression.reduce(val[0]) 
    result
end

def _reduce_3(val, _values, result)
            val[1].quantifier = val[2]
            result = Expression.reduce(val[0], val[1])
          
    result
end

def _reduce_4(val, _values, result)
 result = Expression.reduce(val[0], val[1]) 
    result
end

def _reduce_5(val, _values, result)
            val[0].quantifier = val[1]
            result = val[0]
          
    result
end

# reduce 6 omitted

# reduce 7 omitted

def _reduce_8(val, _values, result)
 result = CharacterClass.new(val[1]) 
    result
end

def _reduce_9(val, _values, result)
 result = CharacterClass.new(val[2]); result.negate = true 
    result
end

def _reduce_10(val, _values, result)
 result = CharacterClass.new(val[0]) 
    result
end

def _reduce_11(val, _values, result)
 result = CharacterClass.new(val[0]) 
    result
end

def _reduce_12(val, _values, result)
 result = Anchor.new(val[0]) 
    result
end

def _reduce_13(val, _values, result)
 result = Character.new(val[0]) 
    result
end

def _reduce_14(val, _values, result)
 result = val.join 
    result
end

def _reduce_15(val, _values, result)
 result = val.join 
    result
end

def _reduce_16(val, _values, result)
 result = val.join 
    result
end

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

def _reduce_20(val, _values, result)
          result = Group.new(val[1])
          result.index = @capture_index_stack.pop
        
    result
end

def _reduce_21(val, _values, result)
          result = Group.new(val[4]);
          result.capture = false;
          options = val[2];
          result.expression.multiline = options[:multiline];
          result.expression.ignorecase = options[:ignorecase];
          result.expression.extended = options[:extended];
        
    result
end

def _reduce_22(val, _values, result)
          result = Group.new(val[3]);
          result.capture = false;
        
    result
end

def _reduce_23(val, _values, result)
          result = Group.new(val[3]);
          result.name = val[2];
          result.index = @capture_index_stack.pop
        
    result
end

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

def _reduce_29(val, _values, result)
 result = val.join 
    result
end

def _reduce_30(val, _values, result)
 result = val.join 
    result
end

def _reduce_31(val, _values, result)
 result = { val[1] => false, val[2] => false, val[3] => false } 
    result
end

def _reduce_32(val, _values, result)
 result = { val[0] => true, val[2] => false, val[3] => false } 
    result
end

def _reduce_33(val, _values, result)
 result = { val[0] => true, val[1] => true, val[3] => false } 
    result
end

def _reduce_34(val, _values, result)
 result = { val[0] => true, val[1] => true, val[2] => true } 
    result
end

def _reduce_35(val, _values, result)
 result = :multiline 
    result
end

def _reduce_36(val, _values, result)
 result = :ignorecase 
    result
end

def _reduce_37(val, _values, result)
 result = :extended 
    result
end

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end   # module Reginald
