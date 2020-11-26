#def rot13(char)
#  if ('a'..'z').include?(char)
#    ((((char.ord - 97) + 13) % 26) + 97).chr
#  elsif ('A'..'Z').include?(char)
#    ((((char.ord - 65) + 13) % 26) + 65).chr
#  else
#    char
#  end
#end
#
#def decrypt(str)
#  str.chars.map { |c| rot13(c) }.join
#end

UP_ALPHABET = ('A'..'Z').to_a
DOWN_ALPHABET = ('a'..'z').to_a

def rot13(char)
  if UP_ALPHABET.include?(char)
    UP_ALPHABET[(UP_ALPHABET.index(char) + 13) % UP_ALPHABET.size]
  elsif DOWN_ALPHABET.include?(char)
    DOWN_ALPHABET[(DOWN_ALPHABET.index(char) + 13) % DOWN_ALPHABET.size]
  else
    char
  end
end

def decrypt(str)
  str.chars.map { |c| rot13(c) }.join
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
