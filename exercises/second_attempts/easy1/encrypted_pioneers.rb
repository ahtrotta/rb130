UPPERCASE_CHARS = ('a'..'z').zip(0..25).to_h.freeze
LOWERCASE_CHARS = ('A'..'Z').zip(0..25).to_h.freeze

def decrypt(text)
  text.chars.each_with_object('') do |char, result|
    uppercase_char_value = UPPERCASE_CHARS[char]
    lowercase_char_value = LOWERCASE_CHARS[char]
    
    if uppercase_char_value
      new_char_value = (uppercase_char_value + 13) % 26
      result << UPPERCASE_CHARS.key(new_char_value)
    elsif lowercase_char_value
      new_char_value = (lowercase_char_value + 13) % 26
      result << LOWERCASE_CHARS.key(new_char_value)
    else
      result << char
    end
  end
end

p decrypt('Nqn Ybirynpr')
p decrypt('Tenpr Ubccre')
p decrypt('Nqryr Tbyqfgvar')
p decrypt('Nyna Ghevat')
p decrypt('Puneyrf Onoontr')
p decrypt('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decrypt('Wbua Ngnanfbss')
p decrypt('Ybvf Unvog')
p decrypt('Pynhqr Funaaba')
p decrypt('Fgrir Wbof')
p decrypt('Ovyy Tngrf')
p decrypt('Gvz Orearef-Yrr')
p decrypt('Fgrir Jbmavnx')
p decrypt('Xbaenq Mhfr')
p decrypt('Fve Nagbal Ubner')
p decrypt('Zneiva Zvafxl')
p decrypt('Lhxvuveb Zngfhzbgb')
p decrypt('Unllvz Fybavzfxv')
p decrypt('Tregehqr Oynapu')
