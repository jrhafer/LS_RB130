NAMES = ['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']

ALPHABET = ('a'..'z').to_a

CODE_KEY = (ALPHABET[0..12].zip(ALPHABET[13..-1]) << [' ', ' ']).to_h

def decode_letters(letter, result)
  CODE_KEY.each do |letter_key, letter_value|
    case letter.downcase
    when letter_key then result << letter_value
    when letter_value then result << letter_key
    else letter
    end
  end
end

def rot_13(name)
  result = ''
  name.chars.each do |letter|
    decode_letters(letter, result)
  end
  result.split.map(&:capitalize).join(' ')
end

NAMES.each { |name| puts rot_13(name) }
