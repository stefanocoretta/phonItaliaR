library(tidyverse)
library(phonetisr)

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
    wordSpell = str_replace_all(word, "([aeiou])'", "\\1\\u0300"),
    wordSpell = ifelse(
      str_sub(word, -1) == "'" & str_sub(PhonesIPA, -1) %in% c("e", "o"),
      str_replace(wordSpell, "([eo])\\u0300", "\\1\\u0301"),
      wordSpell
    ),
    PhonesToken = phonetise(PhonesIPA, split = FALSE, sep = " ", affricates = TRUE),
    PhonesToken_gem = phonetise(PhonesIPA_gem, split = FALSE, sep = " ", affricates = TRUE),
    PhonesToken_gem = str_replace_all(PhonesToken_gem, "(.) ː", "\\1ː")
  ) |>
  relocate(PhonesIPA, PhonesIPA_gem, PhonesToken, PhonesToken_gem, PhoneSyllIPA, wordSpell, everything())

usethis::use_data(phonitalia, overwrite = TRUE)

dict_extra <- tibble(
  wordSpell = c("l'", "gl'", "dell'", "dall'", "un'"),
  PhonesToken_gem = c("l", "ʎ", "d e lː", "d a lː", "u n")
)

phonitalia_dict <- phonitalia |>
  select(wordSpell, PhonesToken_gem) |>
  distinct() |>
  filter(str_detect(wordSpell, "'[^$]", negate = TRUE)) |>
  mutate(
    wordSpell = str_replace(wordSpell, "'", ""),
    # /s/ voicing before voiced consonants
    PhonesToken_gem = str_replace_all(PhonesToken_gem, "s ([bdɡmnlrjw])", "z \\1"),
    # /s/ voicing between vowels
    PhonesToken_gem = str_replace_all(PhonesToken_gem, "([aeɛɔou]) s ([aeɛɔou])", "\\1 z \\2"),
    # /n/ velarisation before velars
    PhonesToken_gem = str_replace_all(PhonesToken_gem, "n ([kɡ])", "ŋ \\1"),
    # /n/ palatalisation before palatals
    PhonesToken_gem = str_replace_all(PhonesToken_gem, "n ((ʃ|tʃ|dʒ))", "ɲ \\1")
  ) |>
  bind_rows(dict_extra) |>
  arrange(wordSpell)

write_tsv(phonitalia_dict, "./data-raw/italian.dict", col_names = FALSE)
