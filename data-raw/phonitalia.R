library(tidyverse)

ipa_repl <- c(
  "E" = "ɛ",
  "O" = "ɔ",
  "c" = "tʃ",
  "g" = "dʒ",
  "z" = "ts",
  "Z" = "dz",
  "G" = "ɡ",
  "L" = "ʎ",
  "S" = "ʃ",
  "N" = "ɲ"
)

ipa2_repl <- c(
  # geminate non-affricates
  "(.)\\1" = "\\1ː",
  # geminate affricates
  "([td][szʃʒ])\\1" = "\\1ː"
)

phonitalia <- read_tsv(
    "data-raw/phonItalia-1.10/phonItalia-1.10-wordforms.tsv",
    col_select = -59
  ) |>
  mutate(
    PhonesIPA = str_replace_all(Phones, ipa_repl),
    PhonesIPA_gem = str_replace_all(PhonesIPA, ipa2_repl),
    PhoneSyllIPA = str_replace_all(PhoneSyll, ipa_repl),
    wordSpell = str_replace_all(word, "(.)'", "\\1\\u0300"),
    wordSpell = ifelse(
      str_sub(word, -1) == "'" & str_sub(PhonesIPA, -1) %in% c("e", "o"),
      str_replace(wordSpell, "([eo])\\u0300", "\\1\\u0301"),
      wordSpell
    )
  ) |>
  relocate(PhonesIPA, PhonesIPA_gem, PhoneSyllIPA, wordSpell, everything())

usethis::use_data(phonitalia, overwrite = TRUE)
