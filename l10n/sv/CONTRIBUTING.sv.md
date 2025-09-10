<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# Riktlinjer för bidrag

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?style=for-the-badge&logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![Code of Conduct](https://img.shields.io/badge/Code%20of%20Conduct-2.1-4baaaa.svg?style=for-the-badge)](CODE_OF_CONDUCT.md)
[![DCO - developer certificate of origin](https://img.shields.io/badge/DCO-Developer%20Certificate%20of%20Origin-lightyellow?style=for-the-badge)](https://developercertificate.org/)

Välkommen! Vi är glada över att du vill bidra till vårt projekt!

Här är vad du behöver veta:

## Bidra

Som ny är det ett värdefullt tillfälle för återkoppling.
Exempelvis genom att:

- Fixa eller rapportera en bugg.
- Föreslå förbättringar av kod, tester och dokumentation.
- Rapportera eller fixa problem som upptäcks under installation eller i utvecklingsmiljöer.
- Föreslå nya funktioner eller förbättringar.

## Uppförandekoder

Var trevlig och respektfull mot varandra.

Vi följer [Contributor Covenants uppförandekod](CODE_OF_CONDUCT.md).

## Att skapa ett ärende

Innan du skapar ett nytt ärende, vänligen kontrollera om ett liknande redan finns.

Om så är fallet kan du lägga till din information som en kommentar till det befintliga ärendet.

### Att rapportera fel

Att rapportera programfel är ett värdefullt sätt att bidra:

1. Öppna ett ärende som sammanfattar felet.
2. Sätt etiketten till "bug".

### Föreslå en förbättring

För att begära en ny funktion:

1. Öppna ett ärende som sammanfattar den önskade funktionaliteten och dess användningsfall.
2. Sätt etiketten till "feature" eller "enhancement".

## Bidra med kod, dokumentation och mer

För att bidra med kod, dokumentation eller andra förbättringar:

1. Diskutera dina planer i förväg för att säkerställa att de stämmer överens med projektmålen.
2. Kontrollera listan över öppna ärenden. Tilldela dig själv ett befintligt ärende eller skapa ett nytt.
3. Följ projektkonventioner för tester, kodstil, dokumentation och commit-meddelanden.
4. Förstå att bidrag kan avslås om de inte överensstämmer med projektets riktlinjer eller mål.
5. Bekanta dig med [Pull Request-livscykeln](#pull-request-livscykel).
6. Godkänn "inbound=outbound"-normen: dina bidrag kommer att vara under samma licens som projektet.
7. [Signera dina commits](#dco---signoff-och-signering-av-en-commit).

## Återkoppling på ärenden och Pull Requests

Projektunderhållare kommer att göra sitt bästa för att granska och svara på ärenden inom fem arbetsdagar.

Kvaliteten på informationen i ditt ärende eller pull request kommer att påverka feedbackslingan.

För icke-triviala bidrag, vänligen diskutera med projektteamet först.

**Om projektet inte är listat som arkiverat underhålls det.**

## Pull Request-livscykel

Vi använder [Fork-and-Pull-modellen](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/getting-started/about-collaborative-development-models#fork-and-pull-model):

1. Forka repositoriet.
2. Skapa en ämnesgren från din forks huvudgren.
3. Pusha dina ändringar till ämnesgrenen i din fork.
4. Öppna en ny pull request till huvudprojektet.
5. Svara på eventuell feedback från projektunderhållare.

## Commit-riktlinjer

### DCO - Signoff och signering av en commit

#### Signoff (DCO-godkännande)

***En Signoff försäkrar projektet om att du har rätt att bidra med ditt innehåll*** +

Lägg till en signoff till din commit med flaggan `-s` eller `--signoff`:

```console
git commit --signoff -m 'fix: lägg till fix för superbug x'
```

#### Signera

***En signatur försäkrar att commiten kom från dig***

Signera din commit med `-S` eller `--gpg-sign`:

```shell
git commit --signoff --gpg-sign -m "fix: lägg till fix för buggen"
```

### Commit-standard

- Använd [Conventional Commit-standarden](https://www.conventionalcommits.org).
- Gruppera relevanta ändringar i commits.
- Skriv tydliga, lättlästa commit-meddelanden.

## Rapportera säkerhetsproblem

För säkerhetssårbarheter, följ riktlinjerna i vår [Säkerhetsinformation](SECURITY.md).

## Utvecklingsriktlinjer

För utvecklingsvägledning, se [DEVELOPMENT Guide](DEVELOPMENT.md).

## Skrivstil och översättningar

- Håll dokumentationen lättläst.
- Använd punktlistor för tydlighet.
- Var koncis och länka till externa resurser vid behov.
- Använd brittisk engelska (t.ex. "colour" istället för "color").
- Följ [en-mening-per-rad](https://sembr.org/)-principen i Markdown eller AsciiDoc.

Engelska är det primära språket, med översättningar på bästa möjliga sätt.

## FOSS-standarder

Vi strävar efter att följa följande standarder och bästa praxis:

- [REUSE Licensspecifikation](https://reuse.software/)
  - Säkerställer tydlig och standardiserad licensefterlevnad i hela projektet.

- [Conventional Commits-format](https://www.conventionalcommits.org/en/v1.1.0/)
  - Ger en tydlig och strukturerad projekthistorik genom standardiserade commit-meddelanden.

- [Keep-A-Changelog-format](https://keepachangelog.com/en/1.1.0/)
  - Upprätthåller en tydlig och användarvänlig versionshistorik.

- [Contributor Covenant-riktlinjer](https://www.contributor-covenant.org/)
  - Upprättar ett socialt kontrakt för respektfullt och inkluderande samarbete.

- [OpenSSF Scorecard](https://scorecard.dev/)
  - Hjälper till att bedöma och förbättra säkerhetshälsan i vårt projekt.

- [PublicCode.yml](https://yml.publiccode.tools/index.html)
  - Underlättar enkel metadataindexering för bättre upptäckbarhet av vårt projekt.

- [Standard for Public Code](https://standard.publiccode.net/)
  - Säkerställer att projektet uppfyller kriterier för offentlig kodkvalitet och hållbarhet.

Bidragsgivare uppmuntras att bekanta sig med dessa riktlinjer och hjälpa oss att upprätthålla dessa standarder i sina bidrag.
