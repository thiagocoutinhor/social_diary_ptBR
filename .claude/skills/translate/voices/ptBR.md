# Voice: ptBR (Brazilian Portuguese)

Settled with the user on 13 Nov 2026, before the first word: ptBR (not
ptPT), **você**, "Seu Diário" for the tab. Decisions below are the
translator's and open to a Brazilian reader's review; where one changes,
change it here too. Marked (?) = worth a native's first look.

## Address and people
- **você**, never tu, never vós. The diary is informal but never chummy:
  it says "você" only where it must (Brazilian Portuguese drops the
  pronoun: "Chegou ao nível 12", not "Você chegou…").
- The diary calls itself **o diário** ("Pelo que o diário soube"), never
  "eu". Notes the player wrote stay first person.
- Other players: the **name**, or **essa pessoa** where English says
  "they" about one unnamed person. Avoid gendered nouns for a stranger
  we know nothing about ("o jogador", "cansado"): use the name, a verb,
  or "essa pessoa". A plural "they" (a group) is "eles" only where
  unavoidable.
- **Gender from the game**: an adjective or participle that agrees with
  the reader or a named character takes the forms — `<you:sozinho/sozinha>`,
  `<1:morto/morta>`, `<they:salvo/salva>` (`Locales/Locale.lua`, "A
  person's gender"). The perfect tense does not agree ("matou", "chegou"),
  so most lines need none; use the forms for "só/sozinho", "morto",
  "ferido", "primeiro/primeira" and the like. Never rebuild a sentence
  round a colon to dodge a gender.
- `{you}` braces: the brace holds the phrase as the reader would say it,
  the other-character form is written out in `grammar.YOU_FOR` ("{Você}" →
  "%s", "{Seu grupo}" → "O grupo de %s"). A braced word is looked up
  lower-case and its form is **not** capitalised, so a form must read as
  it stands: where the phrase opens the sentence, brace a phrase whose
  form also opens the sentence ("{Seu grupo} matou …" → "O grupo de
  Bram matou …"), or put the name first.

## Tense
- **Prose** (Your Diary, profile, tour): pretérito perfeito for events
  ("Chegou ao nível 12 em 6 de outubro. A estrada continua."), presente
  for state ("Já é nível 14"), futuro do pretérito for hindsight
  ("Voltariam a se encontrar no nível 15").
- **Ledger** (rows, tooltips): the same, short, subject dropped ("Missão
  concluída juntos por 1 h 5 min", "te matou duas vezes").

## Typography
- Quotes: **“…”** (nested ‘…’). Apostrophe: ’ where one is needed.
  Ellipsis: … (one character). Dash: — (em dash), never a spaced hyphen.
- Dates: "6 de outubro", with the year only when not this year: "6 de
  outubro de 2025"; short "6 out", "6 out 2025". Weekdays and months
  lower-case ("segunda-feira", "outubro"); no zero padding.
- Time 24 h, the hour unpadded: "18:30", "9:05"; in a sentence "às 18:30".
- Numbers in words up to ten, figures after; decimal comma ("3,2"),
  thousands by a dot ("1.200") or the helpers' no-break space — follow
  what the code glues. Number and unit together ("55 min", "6% de vida").
- Ordinals: "25º", and "25ª" for a death or a match (`grammar.Ordinal`
  with the word list's context: "morte" and "partida" are feminine).
  Words: "primeiro/primeira…", by the noun per `##context`.
- **No middle dots, ever.**
- Case: sentence case; month and weekday names lower-case. Proper names
  keep their case (*Social Diary*, *Seu Diário*).

## Game terms (as the ptBR client says them; verify in the client)
| English | Portuguese |
|---|---|
| level | nível |
| level up | subir de nível |
| group / party | grupo |
| raid | raide |
| quest | missão |
| duel | duelo |
| guild | guilda |
| rare (creature) | raro |
| elite | elite |
| pet | mascote |
| dungeon | masmorra |
| boss | chefe |
| battleground | campo de batalha |
| World PvP | JxJ no mundo |
| wipe | wipe |
| Need / Greed roll | Necessidade / Cobiça |
| gold / silver / copper | ouro / prata / cobre |
| zone | zona |
| profession | profissão |
| campfire | fogueira |
| ghost / spirit | fantasma / espírito |
| flight path | rota de voo |
| hearthstone | Pedra do Lar |
| nameplate | placa de nome |
| Horde / Alliance | Horda / Aliança |
| Undead (race) | Renegado |
| Night Elf (race) | Elfo Noturno |
| drop (an item's) | drop (kept; "a" drop is "um drop") |

## The diary's own words (one word each, kept)
| English | Portuguese |
|---|---|
| the diary | o diário |
| Your Diary | Seu Diário |
| ink in / add to the diary | anotar no diário / adicionar ao diário |
| pencilled in | anotado a lápis |
| rubbed out | apagado |
| forgotten | esquecido |
| remove from the diary | remover do diário |
| delete (for good) | excluir |
| the road | a estrada |
| route (one setting label) | rota |
| crossed paths / met | cruzar caminhos / conhecer ("se cruzaram") |
| toast (Settings, changelog) | aviso |
| card (on the card only) | cartão |
| foe | adversário |
| People | Pessoas |
| Recently nearby | Recentemente próximo |
| sighting | avistamento |
| reunion | reencontro |
| close call | escapada por pouco (a card's title: "Uma escapada por pocuo") |
| hunt | caçada |
| first (a first found) | primeira conquista (a card: "Sua primeira bolsa!") |
| witness | testemunha |
| quest finale | fim de missão |
| profession cap | teto de profissão |
| campfire | fogueira |
| trade | troca |
| duel | duelo |
| find | descoberta |
| died to | nas mãos de |
| slime | gosma |

## Length
Portuguese runs about 15 to 25 % longer than English. Tight surfaces:
toast cards, key-binding column, tickets, Settings labels, tab names, map
keys, `Windows/Reunion` lines, the plate captions. There, prefer the
shorter phrasing ("Reencontro", not "Um reencontro com alguém").

## Not settled
- Whether the tab reads "Seu Diário" or "Diário" on a narrow book spine (?).
- The gender of "they" for a stranger with no name in the key: masculine
  for now ("Um adversário entrou no seu grupo").
- How a bare zone name reads after a preposition ("em Floresta de
  Elwynn" until the client's names are exported: `grammar.ZONES` is
  empty, see the report).
- The ptBR client's exact wording for the game terms above: to check on a
  client in that language.
