<!--
SPDX-FileCopyrightText: 2025 The Open Source Project Template Authors

SPDX-License-Identifier: CC0-1.0
-->

# Checklista för öppen källkod

## Om

Det är lätt att missa viktiga uppgifter när man släpper och underhåller ett projekt med öppen källkod. Denna checklista hjälper till att säkerställa att ditt projekt följer bästa praxis för hälsa, utveckling och säkerhet.

Använd checklistan som diskussionsunderlag för teamet och som grund för kontinuerlig förbättring.

## Arkivering och avveckling av ett projekt

- Bör använda plattformens "Arkiverings"-funktion. På detta sätt blir det skrivskyddat, inklusive ärendetavlan, och flaggas som inaktivt.
- Bör ange i README att projektet inte längre förvaltas.
- Bör arkiveras om det inte finns några aktiva förvaltare.

## Dokumentation

- Måste säkerställa att projektet inkluderar standardfiler för Community Health (CHANGELOG, CONTRIBUTING, CODE_OF_CONDUCT, etc.).  
  Se [README.md Template Files-avsnittet för en komplett lista](../README.md).

- Bör inkludera användningsdokumentation och arkitekturbeskrivningar relevanta för projektet.

## Juridik och licensiering

- Måste säkerställa att projektets licens inte strider mot tredjepartslicenser.
- Licensdeklarationer måste följa [REUSE-licensspecifikationen](https://reuse.software/), vilket säkerställer att allt material har tydlig upphovsrättsinformation.

### Kontroll av namn och varumärken

- Bör säkerställa att projektnamnet inte strider mot ett befintligt projekt eller gör intrång på varumärken.
  - Genomför en allmän sökmotorkontroll för det föreslagna projektnamnet.
  - Utför en [Varumärkessökning](https://www.prv.se/en/ip-professional/trademarks/trademark-databases/).

> **Obs**: Det kan vara helt acceptabelt att använda ett namn som påminner om ett befintligt varumärke - om det befintliga varumärket används för andra tjänster/områden och inte erkänns som ett välkänt varumärke.

## Förvaltning

- Måste säkerställa att förvaltare har utbildning eller erfarenhet av öppen källkod. Till exempel genom att läsa guider på <https://opensource.guide>.
- Måste säkerställa att förvaltare har en plan för hantering av merge/pull-requests (kodgranskningar, etc.).
- Måste säkerställa att förvaltare har en plan för gemenskapsengagemang (svara på ärenden, granska pull-requests).
- Måste säkerställa att någon ansvarar för säkerhetsfrågor.
- Måste inkludera en `Maintainer`-sektion i varje projekt-README (team, individ eller roll).

- Bör etablera en releaseplan med tydliga strategier för tillkännagivande och marknadsföring.
- Bör använda en CODEOWNERS-fil för detaljerad beskrivning av underhåll (kompletterar README:s generella Maintainer-sektion).

## Projektkvalitet

- Måste verifiera att projektet har genomgått en kodgranskning.
- Bör diskutera och fastställa projektets testmål och ambitioner.
- Bör göra det enkelt att använda projektet - dokumentation, exempel, förbyggda releaser, etc.

## Utgåvor och versionering

- Bör använda semantisk versionering och släpptaggar.

## Säkerhet

Denna del av checklistan är baserad på [Open Source Security Foundation (OpenSSF) guide för säkrare utveckling av öppen källkod](https://github.com/ossf/wg-best-practices-os-developers/blob/main/docs/Concise-Guide-for-Developing-More-Secure-Software.md), version: 2023-06-14, [(och tillhörande inlägg)](https://openssf.org/blog/2024/04/15/open-source-security-openssf-and-openjs-foundations-issue-alert-for-social-engineering-takeovers-of-open-source-projects/).

### Allmänt

- Måste använda tvåfaktorsautentisering (2FA) eller multifaktorautentisering (MFA) för att göra det svårare för kontoövertaganden.
- Måste begränsa merge- och push-rättigheter till specifika grenar.
- Måste ha aktiverat grensskydd.
- Måste ha en praxis för signerade commits.

- Bör ha grundläggande kunskap om bidragsgivare och underhållare, och måste göra en periodisk granskning av dessa.
- Bör ha automatiserade testnings- och testtäckningsrutiner, inklusive tester för negativa fall, för att upptäcka buggar och säkra projektet.

### Bidrag

- Bör ha en praxis för kodgranskningar.
- Bör ha goda läsbarhets- och omfattningskrav för att säkerställa att nya PR:er inte är obfuskerade och att användningen av ogenomskinliga binärer minimeras.

### Upptäckt av beroenden och sårbarheter

- Måste använda SCA-verktyg i CI-pipelinen för att upptäcka sårbarheter och licensinkompatibiliteter.
- Måste använda linter-verktyg i CI-pipelinen för att upptäcka sårbarheter och dålig utvecklingspraxis.
- Måste använda verktyg för att skanna efter hemligheter (lösenord, loggar, tokens).
- Måste använda automatiserade verktyg för att övervaka uppdateringar av beroenden för kritiska sårbarheter.
- Måste ha förvaltning för att snabbt hantera uppdatering av sårbarheter.

- Bör använda SAST-verktyg i CI-pipelinen för att upptäcka potentiella sårbarheter och dålig programvarupraxis.
- Bör utvärdera hälsan hos varje nytt direkt projektberoende som läggs till projektet.
- Bör föredra användning av pakethanterare (på system-, språk- och containernivå) för automatiska och konsekventa beroendeuppdateringar.

### Publicering

- Måste producera en SBOM (Software Bill of Materials) för projektet så att slutanvändare och system kan verifiera sårbarheter och licensinkompatibiliteter.
- Måste begränsa publiceringsrättigheter för programvaruartefakter.

- Bör signera alla projektlanseringar.
- Bör göra det enkelt för slutanvändare att uppgradera till nya versioner. Använd semantisk versionering, stöd stabila API:er och flagga för utfasning tidigt.

### Policy

- Måste ha en säkerhetspolicy på plats - den bör innehålla information om var man rapporterar icke-offentliga sårbarheter och processen kring rapporten.

Säkra programvarurutiner och verktyg från OpenSSF och OWASP:

### Verktyg

- [OpenSSF guide till säkerhetsverktyg](https://github.com/ossf/wg-security-tooling/blob/main/guide.md#readme).
- [OWASP Applikationssäkerhetsverktyg](https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools)
- [OpenSSF Scorecards för repositoriesäkerhet](https://github.com/ossf/scorecard)

### Guider

- [OpenSSF:s koncisa guide för utvärdering av programvara med öppen källkod](https://best.openssf.org/Concise-Guide-for-Evaluating-Open-Source-Software)
- [CNCF Security TAG Guide för bästa praxis för programvaruförsörjningskedjan](https://github.com/cncf/tag-security/blob/main/supply-chain-security/supply-chain-security-paper/CNCF_SSCP_v1.pdf).
- [OWASP Fusklappar](https://cheatsheetseries.owasp.org/index.html).
- [OWASP Programutvecklarguide](https://owasp.org/www-project-developer-guide/release/).
- [Signering av artefakter i försörjningskedjan - OpenSSF sigstore-projekt](https://www.sigstore.dev/).
- [OWASP Application Security Verification Standard - ASVS](https://owasp.org/www-project-application-security-verification-standard/).
- [Supply-chain Levels for Software Artifacts - (SLSA)](https://slsa.dev/).

## Arbetsflöden

- Kan diskutera ditt GitHub-arbetsflöde - en kort sammanfattning och förslag finns i [CONTRIBUTING - Pull Request Lifecycle](CONTRIBUTING.md)

## Spefikationer och standarder att följa

Följande kommer att hjälpa ditt projekt med öppen källkod att vara samarbetsvänligt, återanvändbart, tillgängligt och uppdaterat.

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
