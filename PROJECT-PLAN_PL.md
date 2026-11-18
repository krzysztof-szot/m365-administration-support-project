# Plan projektu Microsoft 365 Administration & Support

Aktualizacja: 17 listopada 2026 r.

Etapy 01–13 są COMPLETE; etap 13 obejmuje zweryfikowane zadania praktyczne, a etap 14 ma status IN_PROGRESS. Opublikowano 153 obrazy: Day 01 — 31, Day 02 — 21, Day 03 — 11, Day 04 — 27, Day 05 — 14, Day 06 — 9, Day 07 — 6, Day 08 — 7, Day 09 — 7, Day 10 — 4, Day 12 — 9, Day 13 — 7. Globalna tabela ma 32 PASS i 0 NOT_RUN; 25 testów offline kodu liczymy osobno. W Day 05 doszły T11–T13, w Day 06 T14–T15, w Day 07 T17, w Day 08 T18–T20, w Day 09 T21–T22, w Day 10 T23 i T31; T16 rozszerzono bez podwójnego liczenia; fazy kontrolne i odzyskanie nie tworzą dodatkowych numerów testów. Piętnaście przypadków M365-001–015 jest rozwiązanych jako ćwiczenia laboratoryjne; T26–T28 zaliczono w etapie 12.

Zweryfikowano pocztę z zewnętrznym Gmail, zapis i ponowne otwarcie dokumentów OneDrive/SharePoint, trwałość wiadomości Teams oraz odmowę panelu administracyjnego dla Anny. Politykę MFA oceniono w Report-only, włączono i uzyskano Success z istniejącym claimem MFA. Świeże zatwierdzenie push nie zostało uchwycone. Dodatkową rolę CA usunięto; właściciel potwierdził dalszy dostęp adm-lab oraz nowe logowania i aktywny Global Administrator dla obu kont awaryjnych.

## Zakończone Day 02 i Day 03

Utworzono Piotra i Marka; po kontrolowanym braku licencji przywrócono Piotrowi pocztę i sprawdzono wymianę wiadomości. Department i Job title zgłoszono jako uzupełnione; zgodnie z decyzją właściciela bez screenów 04a/04b. Grupę MFA rozszerzono do trzech osób, a wyniki polityki są Success. Nie uchwycono nowej metody zatwierdzenia ani pola Authentication requirement dla obu nowych użytkowników.

Powstała prywatna grupa BFL-M365-Finance: właścicielka Anna, członkowie Anna i Piotr, link do witryny, bez Teams. Listę DL-M365-Finance sprawdzono funkcjonalnie; nadawcą był Marek spoza członkostwa. Po usunięciu Piotra bezpośrednia poczta nadal działała, a kopii z listy nie otrzymał przez 10 minut. Przywrócenie członkostwa odtworzyło dostarczanie do obu odbiorców.

Alias m365.finance prowadzi do istniejącej skrzynki Anny. Pierwsza próba wewnętrzna pokazała w nagłówku adres podstawowy; dopiero para wysłane/odebrane z Gmaila potwierdziła jawnie adres aliasu. Surowe nagłówki pozostają prywatne. Rola Exchange Recipient Administrator na adm-lab pozostaje Direct/Active/Permanent do kolejnych zadań odbiorców i wymaga późniejszego przeglądu.

Pierwsze cztery jednostki nauki wykonano 14 listopada 2026 r.; Etapy 05–09 wykonano 16 listopada. Rozpiska godzin w [roadmapie](docs/roadmap.md) jest szacunkiem, a nie pomiarem czasu.

## Zakończony Day 04

Helpdesk ma zablokowane bezpośrednie logowanie. Piotr odczytał skrzynkę, otrzymał odmowę wysyłania bez Send As, a po osobnym nadaniu tego uprawnienia wiadomość dotarła do Anny z nadawcą Helpdesk i odpowiedź wróciła do skrzynki. Anna osobno wysłała wiadomość w imieniu Helpdesk. Marek otrzymał odmowę otwarcia; właściciel potwierdził jego tożsamość i działający własny Inbox.

Marek odczytał wydarzenie w kalendarzu Anny bez możliwości edycji. Tymczasowe Can edit pozwoliło zmienić opis; zapis widoczny u Anny potwierdzono tekstowo. Przywrócono Can view all details, a nowe logowanie nie przywróciło edycji.

Sala BFL-M365-Room-01 ma automatyczne przyjmowanie/odrzucanie, okno 30 dni i limit 2 godzin. Na 16 listopada Anna ma zaakceptowane 11:00–11:30. Próba Marka 11:15–11:45 została odrzucona z jawnym wskazaniem kolizji; przesunięcie jego ROOM-02 na 12:00–12:30 zakończyło się akceptacją. Właściciel potwierdził blokadę logowania sali i zachowanie rezerwacji Anny.

Finalne screeny pokazują poprawione godziny AM oraz właściwego organizatora. Nie wyliczamy czasu propagacji; diagnostykę PowerShell pominięto zgodnie z decyzją właściciela. Szczegóły i źródła poszczególnych obserwacji: [Day 04](docs/stages/04-delegation-calendars-and-rooms.md), [testy](tests/day-04.md) i [27 dowodów](evidence/day-04/README.md).

## Zakończony Day 05

Porównano Service health, zwykłą dostawę Marek → Piotr i ślad Receive → Submit → Deliver. Dla celowo nieistniejącego adresu NDR i Trace potwierdziły 550 5.1.10 RESOLVER.ADR.RecipientNotFound oraz błąd wyszukania SMTP. Przypadek zamknięto jako rozpoznane, oczekiwane odrzucenie; nie tworzono brakującego odbiorcy ani nie deklarujemy poprawionej ponownej wysyłki tej samej wiadomości.

Reguła TR-M365-001-Lab-Block-Marek-To-Piotr wymaga nadawcy Marek AND odbiorcy Piotr AND znacznika [LAB-BLOCK] w temacie. Oznaczona RULE-01 ma Failed i zwrotkę z własnym wyjaśnieniem; nieoznaczona RULE-02 ma Delivered, a jej otwarcie przez Piotra właściciel potwierdził tekstowo. Po wyłączeniu reguły nowa oznaczona RULE-03 ma Delivered o 06:54 UTC. Końcowy stan reguły: **Disabled**, z zachowanym trybem Enforce. Dostawę RULE-03 potwierdza Trace; osobnego potwierdzenia otwarcia nie zgłoszono. Czasu propagacji nie zmierzono.

Trace działał jako adm-lab według potwierdzenia właściciela, natomiast regułę skonfigurowano jako bg01. Próba RG-M365-Lab-Transport-Rules zakończyła się błędem delegowania; skutecznego nadania uprawnienia i pełnego stanu ewentualnego częściowego obiektu nie potwierdzono. Diagnostykę PowerShell oraz dodatkowe screeny ról odłożono zgodnie z decyzją właściciela. Nie są warunkiem ponownego zaliczania zakończonych testów przepływu poczty.

W publicznej wersji screena 11 domena jest zasłonięta także w How to Fix It. Szczegóły: [Stage 05](docs/stages/05-mail-flow-troubleshooting.md), [testy](tests/day-05.md) i [14 dowodów](evidence/day-05/README.md).

## Zakończony Day 06

Właściciel potwierdził przeznaczenie BFL-WKS01 wyłącznie do labu: Windows 11 Enterprise Evaluation build 26100, 4 GB RAM, VMware Workstation Pro. Początkowo w VM brakowało Worda i Internetu. Później łączność działała, a instalacja Apps zakończyła się powodzeniem; dokładnej przyczyny i sposobu naprawy sieci nie podano. Nie przypisujemy awarii wyłączonemu kontrolerowi domeny ani samemu DNS.

Screen 01 pokazuje poprawnie zalogowanego Marka, ale Activation Required. Po prowadzonej procedurze odświeżenia licencji screen 02 pokazuje Subscription Product. Osobny kontrolowany test tożsamości w 04 ma Piotra w User Information i nadal subskrypcję dla Marka. To korekta aktywnego użytkownika, a nie uchwycona utrata aktywacji lub przełączenie licencji na Piotra.

Work Offline w 05 wyjaśnia rozbieżność między przeglądarką a desktopem. Właściciel potwierdził około 60 sekund braku wiadomości w desktopie; 06 pokazuje tę samą OFFLINE-01 po powrocie online oraz Connected to Microsoft Exchange. Nowy SYNC-02 dotarł do web. Nie wyliczamy czasu synchronizacji z godzin wiadomości.

W 07 kalendarz Anny ma Read-Only; historyczny opis Edited by Marek pochodzi z Day 04. W 08 Piotr odczytuje końcową odpowiedź w Helpdesk; pełny obieg i nadawcę Helpdesk właściciel potwierdził tekstowo. Końcowo przywrócono profil Marka i aktywny Word. Nie zgłoszono usunięcia dodatkowego profilu Piotra. Nowy Outlook, rejestracja/MDM i opcjonalne ćwiczenie Copilot nie były walidowane.

Szczegóły: [Stage 06](docs/stages/06-outlook-and-microsoft-365-apps.md), [testy](tests/day-06.md) i [9 dowodów](evidence/day-06/README.md). Dodatkowy wycinek wersji Outlooka zapisano jako 09; potwierdzenia tekstowe zastępują zbędne kolejne screeny, z jawnym przypisaniem źródła.

## Zakończony Day 07

Właściciel potwierdził From a group i Private dla BFL-M365-Finance. Screen 01 pokazuje Annę jako Owner i Piotra jako Member; Marek nie jest wymieniony. Dokument STANDARD-01 zawiera dopisaną linię Piotra; jego zapis, odczyt przez SharePoint i widoczność zmiany po ponownym otwarciu u Anny potwierdzono tekstowo.

Kanał Finance-Confidential początkowo ma tylko Annę. Piotr nadal otwiera plik standardowy, ale nie widzi kanału prywatnego, a bezpośredni link zwraca You need access. Dodanie go jako członka kanału w Teams daje dostęp; późniejsze usunięcie przywraca odmowę w świeżej sesji bez odebrania członkostwa zespołu. Końcowy stan Anna-only i ponowną odmowę zgłoszono tekstowo. Nie deklarujemy stałego dostępu Piotra ani zmierzonego czasu propagacji.

Witryna zespołu: /sites/bfl-m365-finance. Kanał prywatny: /sites/BFL-M365-Finance-Finance-Confidential. To dwie osobne witryny, a nie tylko różne adresy dokumentów. Nie zastępuje to testów niezależnej witryny wiedzy ze Stage 08.

Anna uczestniczyła w spotkaniu na komputerze, Piotr na telefonie w aplikacji Teams. JPG 06 pokazuje odbierany dokument; dźwięk w obu kierunkach, zmianę widoku, zatrzymanie prezentacji i zakończenie spotkania potwierdził właściciel. Nie był to test ograniczony do jednego urządzenia; nie mierzono parametrów jakości połączenia. Widoczny panel podsumowania Worda nie stanowi walidacji Copilot.

Poprawiony screen 04 zasłania nazwę tenanta również w Source; publikujemy tę wersję. Zachowano pięć PNG i jeden JPG bez konwersji. Szczegóły: [Stage 07](docs/stages/07-teams-and-connected-sites.md), [testy](tests/day-07.md), [6 dowodów](evidence/day-07/README.md) i [M365-010](tickets/M365-010-private-channel-membership-recovery.md).

## Zakończony Day 08

Anna utworzyła niezależną witrynę komunikacyjną /sites/BFL-M365-Knowledge. Screeny 01/02 pokazują stan początkowy i role Anna Full Control, Marek Edit, Piotr Read. Knowledge zawiera oryginalny LAB-D08-KB-01.docx z Category Mail i Status Draft. Marek zapisał zmianę, Anna zobaczyła ją po ponownym otwarciu, a Piotr odczytał dokument bez możliwości edycji; część funkcjonalną potwierdził właściciel, a screen 04 pokazuje Viewing i dopisaną linię.

Oryginał wcześniej zgłaszał blokadę współdzielonego użycia przez Annę. Zapis pojedynczych metadanych, świeża sesja i Check out nie pomogły. TXT kontrolny oraz przesłana kopia KB-02 przyjmowały metadane. Następnie zaczął działać ten sam oryginał bez podmiany; właściciel wyjaśnił to odczekaniem po zamknięciu pliku przez Annę. Dokładnego momentu zwolnienia blokady ani jej mechanizmu nie zmierzono. Nie przypisujemy naprawy kopii ani nieudanemu Check out. Oba pliki pomocnicze zostały usunięte według potwierdzenia właściciela.

Ustawienia Specific people/Piotr/Can view, usunięcie linku i komunikat This link has been removed potwierdzono tekstowo. Screen 05 pokazuje otwarcie dokumentu przez link, nie okno jego ustawień. Piotr nadal otwierał KB-01 przez bibliotekę. Nie deklarujemy, że usunięcie linku przywróciło dziedziczenie dokumentu: końcowej flagi dziedziczenia i pełnej ACL KB-01 nie uchwycono osobno.

Folder LAB-D08-Restricted początkowo dziedziczył Knowledge: Owners Full Control, Members Edit, Visitors Read — dodatkowy wycinek jako 07. Oczekiwane wyniki Check Permissions przed/po zmianie potwierdzono bez literalnego wydruku. Po przerwaniu dziedziczenia i usunięciu przypisania Visitors Piotr otrzymał odmowę w 06, Marek nadal otwierał TXT, a Piotr główny KB-01. Przywrócenie dziedziczenia odtworzyło dostęp Piotra do tego samego TXT. Końcowo folder jest przywrócony, nie pozostawiony jako trwałe wykluczenie. Na koniec Day 08 opcjonalny Copilot i synchronizacja OneDrive nie były jeszcze wykonane; klient OneDrive jest testowany osobno w Day 09.

Szczegóły: [Stage 08](docs/stages/08-sharepoint-and-sharing.md), [wyniki](tests/day-08.md), [7 dowodów](evidence/day-08/README.md), [M365-011](tickets/M365-011-knowledge-reader-access.md) i [M365-012](tickets/M365-012-revoked-link-retained-access.md).

## Zakończony Day 09

W BFL-WKS01 działa klient służbowego OneDrive Marka, wersja 26.204.1019.0007, 64-bit według właściciela. Folder M365-Lab-D09 i syntetyczny TXT posłużyły do testów: lokalny V1 widoczny w web, Free up space, ponowne pobranie i Always keep. Screen 01 pokazuje końcową dostępność oraz Backed up and synced.

Podczas pauzy przesłano roboczy V2 z Pobranych do chmury przez Replace. Właściciel potwierdził V1 w rzeczywistym folderze OneDrive; poprawiony 02 pokazuje V2 w web, V1 lokalnie i Paused. Trzecia linia lokalna ma już tekst V2, więc screen nie dowodzi pełnej zgodności z pierwotnym wzorcem. Po Resume i świeżym otwarciu oryginału potwierdzono lokalny V2 oraz zdrowy klient, zgodnie z 03. Nie zmierzono dokładnego opóźnienia.

Historia w 04 zawiera 1.0 i 2.0. Restore 1.0 przywrócił wszystkie trzy pierwotne linie V1 w web i lokalnie — 05. Usunięcie wyłącznie pliku testowego przeniosło go do kosza i usunęło kopię lokalną według właściciela; Restore z kosza przywrócił pełną bazę w obu widokach — 06/07. Końcowo klient jest wznowiony i zdrowy, oryginał ma V1, a osobna robocza kopia V2 pozostała w Pobranych poza OneDrive. Nie zakładamy zachowania wcześniejszego przypięcia Always keep po odtworzeniu.

Synchronizacja przenosi również usunięcia; historia i kosz to sprawdzone mechanizmy odzyskiwania w tym zakresie, nie dowód niezależnego backupu. Porównano przestrzeń użytkownika z istniejącą wspólną biblioteką Knowledge, bez dodawania synchronizacji SharePoint ani testu przekazania danych odchodzącego pracownika.

Szczegóły: [Stage 09](docs/stages/09-onedrive-sync-and-recovery.md), [wyniki](tests/day-09.md), [7 dowodów](evidence/day-09/README.md), [M365-013](tickets/M365-013-onedrive-paused-sync-recovery.md) i [M365-014](tickets/M365-014-onedrive-file-recovery.md). Na koniec Day 09 Stage 10 pozostawał PLANNED.

## Zakończony Day 10

17 listopada adm-lab odczytał Service health o 05:40 czasu Polski. OneDrive i SharePoint miały Healthy; Exchange/Teams advisory, a Microsoft 365 suite pięć advisories. MO1489432 dotyczy kontaktów i Speed Dial; status Service degradation i plan zakończenia poprawki 20 listopada pochodzą z relacji właściciela. Występowania objawu w labie nie sprawdzono.

MC1545696 zapowiada adnotacje chronionych PDF bez usuwania etykiet. Panel pokazuje połowę–koniec stycznia 2027, szczegółowy rollout koniec stycznia; brak osobnego Act by i obowiązku włączenia funkcji. Nie wykonano testu przyszłej funkcji ani poszerzenia praw.

W Knowledge są cztery instrukcje DOCX, widoczne w 03. Piotr czyta bez edycji. Helpdesk przeszedł obieg z Markiem. Stary link po usunięciu zwrócił This link has been removed, a dokument nadal otwierał się przez bibliotekę. T31 zachowuje przypisanie do Stage 08, lecz jawny PASS zapisano przy tym powtórzeniu w Stage 10; liczba identyfikatorów testów nie wzrosła.

Osobny M365-Lab-D10/LAB-D10-KB-RECOVERY-01.txt wrócił do pełnego V1 przez historię według EN i przez kosz według DE. Wersja EN wymagała doprecyzowania w czacie; końcowe wyniki były poprawne, a DE wykonano bez problemu. 04 pokazuje pełną treść lokalną i obecność pliku w web, nie podgląd treści w chmurze. Pełne V1 web i zdrowy klient są potwierdzone tekstowo. Nie opisujemy tego jako samodzielnego assessmentu.

Przygotowano wspomagany przegląd zgłoszeń i pakiet eskalacji błędu delegacji Exchange. Brak wysłanego zgłoszenia, wykonanej diagnostyki PowerShell i naprawy RBAC. Backlog pozostaje 14 rozwiązanych / 1 planowany; przyszłe przekazanie danych pracownika nadal nie jest wykonane.

Szczegóły: [Stage 10](docs/stages/10-support-operations-and-knowledge.md), [wyniki](tests/day-10.md), [4 dowody](evidence/day-10/README.md), [instrukcje](knowledge-base/README.md), [przegląd zgłoszeń](tickets/stage-10-case-review.md) i [pakiet eskalacji](tickets/escalations/exchange-role-delegation.md).

## Cel i sposób pracy

Projekt ma uczyć administracji i diagnozy pod stanowiska junior administratora M365 oraz IT support. Fikcyjna firma Baltic Finance korzysta z trzech syntetycznych kont, osobnych tożsamości administracyjnych, Helpdesk, Finance, witryny wiedzy i sali.

Plan obejmuje 14 etapów i około 50–65 godzin razem z dokumentacją. Dni są orientacyjne: harmonogram dopasuj do rzeczywistej daty końca subskrypcji. Materiały zapisuj po każdej sesji. Dokumentacja wykonania jest po angielsku, prowadzenie ćwiczeń po polsku.

Każdy etap: wyjaśnienie wymagania → stan początkowy → konfiguracja → test użytkownika → kontrolowany problem → diagnoza i odzyskanie → zapis wyników. Przed zmianą zapisz oczekiwany rezultat i sposób przywrócenia stanu.

## Etapy

### 01. Tenant i role — dzień 1

Potwierdź dokładny plan, Teams, licencje, termin triala i stan odnowienia. Oddziel administrację od pracy użytkownika, skonfiguruj MFA oraz prywatny sposób odzyskania dostępu. Sprawdź operację dozwoloną administratorowi i odmowę dla zwykłego użytkownika.

Szczegółowe zadania i warunki zakończenia: [etap 01](docs/stages/01-tenant-and-roles.md).

### 02. Użytkownicy i licencje — dzień 2–3

Annę przygotowano w Day 01; wykorzystaj jej konto i utwórz Piotra oraz Marka. Poznaj lokalizację użycia i plany usług. Porównaj grupę zabezpieczeń, Microsoft 365 i listę dystrybucyjną. Na pustym koncie zdiagnozuj brak uprawnienia do usługi i potwierdź naprawę.

Szczegółowe zadania i warunki zakończenia: [etap 02](docs/stages/02-users-licenses-and-groups.md).

### 03. Exchange i odbiorcy — dzień 4–5

Skonfiguruj alias i listę dystrybucyjną. Poznaj typy skrzynek i grup. Zbadaj przypadek nowego pracownika bez poczty działowej. Potwierdź rzeczywistą dostawę oraz brak kopii u wykluczonego użytkownika.

Szczegółowe zadania i warunki zakończenia: [etap 03](docs/stages/03-exchange-recipients-and-mail.md).

### 04. Delegacje, kalendarze i sala — dzień 6–7

Wykonane: Helpdesk i sala, oddzielne testy Full Access / Send As / Send on behalf, porównanie odczytu i edycji kalendarza z przywróceniem oraz konflikt rezerwacji rozwiązany zmianą terminu.

Szczegółowe zadania i warunki zakończenia: [etap 04](docs/stages/04-delegation-calendars-and-rooms.md).

### 05. Przepływ poczty — dzień 8–9

Wykonane: NDR i Trace dla nieistniejącego odbiorcy, trzy warunki AND reguły, odrzucenie oznaczonej wiadomości, dostawa nieoznaczonej kontroli oraz dostawa nowej oznaczonej próby po wyłączeniu. T11–T13 PASS; reguła pozostaje Disabled.

Szczegółowe zadania i warunki zakończenia: [etap 05](docs/stages/05-mail-flow-troubleshooting.md).

### 06. Outlook i Office — dzień 10–11

W osobnym profilu lub VM zbadaj aktywację aplikacji, niewłaściwą tożsamość oraz różnicę przeglądarka–klient. Udokumentuj wersję Outlooka. Ustal, czy problem dotyczy konta, licencji, usługi czy klienta.

Wykonano w labowej VM BFL-WKS01: instalację Apps, aktywację jako Marek, zapis/ponowne otwarcie/edycję lokalnego dokumentu i wymianę poczty web–desktop. Word i klasyczny Outlook: Version 2610, Build 20527.20196, Current Channel; Outlook 64-bit potwierdzony tekstowo. Przy zalogowanym Piotrze subskrypcja nadal wskazywała Marka; przywrócono właściwego użytkownika. Work Offline wyjaśnił brak nowej wiadomości w desktopie przy działającym web; po powrocie online ta sama wiadomość dotarła i nowa kontrola wysyłania zadziałała. Kalendarz Anny otwarto jako Read-Only, a Piotr sprawdził pełny obieg odpowiedzi Helpdesku. Końcowy profil Outlooka i aktywny Word Marka potwierdzono. **Stage 06 COMPLETE; T14/T15 PASS.**

Szczegółowe zadania i warunki zakończenia: [etap 06](docs/stages/06-outlook-and-microsoft-365-apps.md).

### 07. Teams i SharePoint — dzień 12–13

Wykonano: Teams dodano do istniejącej prywatnej grupy BFL-M365-Finance, Anna Owner, Piotr Member. Finance-Operations: Piotr otwiera i zapisuje plik, a Anna widzi zmianę po ponownym otwarciu. Finance-Confidential: odmowa dla Piotra, dostęp po dodaniu do kanału, ponowna odmowa w świeżej sesji po usunięciu przy zachowaniu dostępu standardowego. Końcowo kanał prywatny ma tylko Annę. Potwierdzono osobne witryny SharePoint oraz spotkanie komputer/telefon z dźwiękiem w obu kierunkach i udostępnianiem. **Stage 07 COMPLETE; T16 pozostaje PASS, T17 nowy PASS.**

Szczegółowe zadania i warunki zakończenia: [etap 07](docs/stages/07-teams-and-connected-sites.md).

### 08. SharePoint i udostępnianie — dzień 14–16

Wykonano: niezależną witrynę komunikacyjną BFL-M365-Knowledge, bibliotekę Knowledge i Mail/Draft na oryginalnym KB-01. Anna Full Control, Marek Edit, Piotr Read; zapis Marka widoczny po ponownym otwarciu u Anny, Piotr bez edycji. Link Specific people/Piotr/Can view usunięto: stary URL zwraca This link has been removed, ale biblioteka nadal pozwala na odczyt. Na osobnym folderze usunięto tymczasowo przypisanie Visitors, uzyskano odmowę dla Piotra z kontrolami i przywrócono dziedziczenie oraz dostęp do TXT. **Stage 08 COMPLETE; T18–T20 PASS.**

Szczegółowe zadania i warunki zakończenia: [etap 08](docs/stages/08-sharepoint-and-sharing.md).

### 09. OneDrive i odzyskiwanie — dzień 17–18

Wykonano: Files On-Demand, kontrolowaną pauzę i Resume, przywrócenie wersji 1.0 oraz usuniętego pliku z kosza OneDrive. Pełna treść pierwotnego V1 jest zgodna w web i lokalnie po obu odzyskaniach. **Stage 09 COMPLETE; T21/T22 PASS.**

Szczegółowe zadania i warunki zakończenia: [etap 09](docs/stages/09-onedrive-sync-and-recovery.md).

### 10. Support i instrukcje — dzień 19–20

Wykonano przegląd Service health i Message center, trzy instrukcje EN i niemiecki odpowiednik, odczyt Piotra bez edycji oraz odtworzenie wybranych procedur. Przygotowano przegląd wpływu/pilności i pakiet do drugiej linii dla nierozwiązanego RBAC. **Stage 10 COMPLETE; T23/T31 PASS.** Pakiet nie został wysłany, a problem delegacji nie jest oznaczony jako naprawiony.

Szczegółowe zadania i warunki zakończenia: [etap 10](docs/stages/10-support-operations-and-knowledge.md).

### 11. Raporty PowerShell — dzień 21–23

Wykonano trzy raporty tylko do odczytu na laptopie: licencje Marka (62 wiersze SPB), Finance (cztery wiersze) i Helpdesk (siedem wpisów). Wybrane wartości porównano ze świeżym portalem. Kontrola mieszana zachowała 124 wiersze i błąd osobnego identyfikatora, PARTIAL/2. W tej samej sesji Marek odczytał własną skrzynkę, ale Helpdesk pozostawał niewidoczny; po przywróceniu adm-lab pełny odczyt wrócił. T24/T25 PASS w zakresie uzgodnienia danych i obsługi błędu widoczności. Nie potwierdzono konkretnej brakującej roli ani HTTP 403; dodatkowy błąd ACL ujawnił wewnętrzne 401. Ścisła kontrola ACCESS_DENIED pozostaje niepotwierdzona. Kontekst Graph zawiera także ReadWrite; nie jest demonstracją najmniejszych uprawnień. Kod ma 25 zaliczonych izolowanych testów offline na środowisku asystenta 7.6.9, oddzielonych od rzeczywistych odczytów użytkownika 7.7.0. Surowe eksporty pozostają prywatne; opublikowano wybrane zanonimizowane dane. Błąd RBAC z etapu 05 pozostaje nierozwiązany.

Szczegółowe zadania i warunki zakończenia: [etap 11](docs/stages/11-powershell-reporting.md).

### 12. Cykl życia pracownika — dzień 24–25

Wykonano 17 listopada 2026 r. Ponownie sprawdzono usługi istniejącego Piotra, zmieniono Department na IT i stanowisko na IT Support Specialist. Dodano dostęp do nowego prywatnego IT, zapisano zmianę w pliku i zweryfikowano ją jako Marek; usunięto Finance/DL z negatywną kontrolą i działającymi zasobami kontrolnymi. Przekazano jeden zatwierdzony TXT jako osobną kopię do własnego OneDrive Anny, z pełnymi trzema liniami V1.

Zapisana blokada uniemożliwia nowe logowanie; zachowanie starej sesji jest oddzielną relacją właściciela. Istniejącą skrzynkę przekształcono w SharedMailbox. Błędnego delegata Annę ze starego projektu usunięto, a właściwe FullAccess potwierdzono odczytem i otwarciem zachowanej poczty. Po przeglądzie rozmiaru 2,248 MB, archiwum i odczytanych blokad odebrano Premium; konto kotwiczące pozostaje zablokowane, a Anna nadal czyta pocztę i własną kopię. Marek nadal otwiera IT, Anna Helpdesk. Zgłoszone usunięcia obejmują IT, delegacje Helpdesk i Knowledge Visitors. Próba Check Permissions zwróciła komunikat polityki udostępniania, a nie poziomy dostępu — nie deklarujemy pełnego audytu ACL. Źródłowy OneDrive jest nielicencjonowany; kopia jednego pliku nie jest migracją całego dysku ani backupem.

**Stage 12 COMPLETE; T26–T28 PASS; M365-015 RESOLVED.** Zweryfikowany [runbook](runbooks/employee-lifecycle.md), [wyniki](tests/day-12.md), [9 dowodów](evidence/day-12/README.md) i [opis etapu](docs/stages/12-employee-lifecycle.md). Brak automatycznego przywrócenia konta; wyjątek RBAC z etapu 05 pozostaje nierozwiązany.

### 13. Weryfikacja praktyczna — dzień 26–27

18 listopada wykonano i zweryfikowano pięć zadań: obieg Helpdesku z Anną w imieniu skrzynki, Word i klasyczny Outlook Marka, tymczasową edycję jednego pliku oraz cofnięcie dostępu, zapis offline z późniejszą synchronizacją V2 i świeże raporty Piotr/Finance/Helpdesk zgodne z wybranymi widokami portalu. Operacje wykonano ze wsparciem procedur i przygotowanych launcherów. Kryterium T32 zmieniono 18 listopada na weryfikację pięciu wykonanych zadań praktycznych, z dopuszczonym wsparciem procedur. Wszystkie mają potwierdzone wyniki funkcjonalne: **T32 PASS, etap 13 COMPLETE**. Pierwotnego sprawdzianu bez podanej sekwencji nie przeprowadzono; jego kryterium zostało zastąpione, a nie zaliczone jako samodzielne wykonanie.

[Etap 13](docs/stages/13-independent-capstone.md) · [Wyniki](tests/day-13.md) · [7 obrazów](evidence/day-13/README.md) · [Aktualne wyciągi](samples/capstone/README.md)

### 14. Portfolio i zachowany lab — dzień 28–30

Status IN_PROGRESS. Właściciel zachowuje obecne zasoby. Przegląd obejmuje zgodność twierdzeń, liczb i dowodów, prywatność, odnośniki oraz lokalną kopię publicznej części repozytorium. Nie wykonano usuwania ani anulowania subskrypcji. Dokładne terminy i ustawienia odnawiania pozostają prywatne; ich świeże sprawdzenie jest jeszcze oczekiwane.

[Etap 14](docs/stages/14-portfolio-and-lab-closure.md) · [Stan zachowanych zasobów](docs/lab-closure.md) · [Podsumowanie portfolio](docs/portfolio-summary.md)

## Docelowy rezultat

- 15 opisanych zgłoszeń syntetycznych.
- 32 sprawdzenia funkcjonalne, także odmowy dostępu i odzyskanie.
- Trzy raporty PowerShell tylko do odczytu.
- Instrukcje użytkownika, w tym jeden niemiecki odpowiednik.
- Zweryfikowany runbook cyklu życia i pięć praktycznych zadań końcowych.

To cele całego projektu. Etapy 01–13 są COMPLETE w przyjętym zakresie; etap 14 jest IN_PROGRESS. T32 ma status PASS według przyjętego 18 listopada kryterium pięciu zadań praktycznych; samodzielny sprawdzian bez procedur nie był oceniany. Publikowane wyniki muszą odpowiadać zapisanym obserwacjom i dowodom; przypisanie licencji lub utworzenie pliku nie kończy etapu.

W Day 01 wdrożono ograniczony pilot MFA przez Conditional Access w istniejącym tenancie. Windows 11, Chrome 157.0.8103.52 dla Anny i Edge 157.0.4341.46 dla administratorów zapisano na podstawie raportu właściciela. Service health pokazało pięć advisories dla Microsoft 365 suite; nie wnioskujemy z tego o zdrowiu wszystkich usług ani o odtworzonym incydencie. Licencje Premium umożliwiają rozszerzenia z Intune. Dodatkowy [pilot Copilot](docs/copilot-pilot-plan.md) obejmuje trzy sesje, około 5–7 godzin, zintegrowane z etapami 06, 08, 10 i 13; mamy jedno miejsce Copilot. Własna domena i udostępnienie zewnętrzne pozostają rozszerzeniami. PIM, pełne odtworzenie E5/Entra Suite, hybrydowy Exchange, Teams Phone i zaawansowane holdy są poza zakresem podstawowym.

## Start

Przejrzyj [wyniki](tests/README.md), [przypadki](tickets/README.md) i [baseline](docs/01-environment-baseline.md), a następnie przejrzyj [stan zachowanych zasobów](docs/lab-closure.md). Rzeczywiste dane logowania, domenę, identyfikatory, termin triala i szczegóły rozliczeń przechowuj prywatnie. Źródła techniczne i licencyjne: [Microsoft](docs/sources.md).

## Screeny podczas ćwiczeń

Przed istotnym punktem dowodowym prowadzący wskazuje moment wykonania screena, widok i nazwę pliku. Zgodnie z ustaleniem z Day 05 ograniczamy liczbę obrazów do potrzebnej konfiguracji i wyników; pomocnicze odczyty mogą być potwierdzone tekstowo z jawnym przypisaniem źródła. [Indeks dowodów](evidence/README.md) opisuje 153 opublikowane obrazy; Stage 11 ma dowody tekstowe i eksporty bez nowych screenów. W obrazach Day 03 zanonimizowano wskazane identyfikatory, domenę oraz nazwisko zewnętrznego nadawcy; ograniczenia interpretacji opisano w indeksie. W Day 04 podmieniono 02 na wersję z zasłoniętą domeną, a zapisane wyniki odróżniają konfigurację, fakty widoczne na screenach i potwierdzenia właściciela. Nazwy i moment wykonania nowych dowodów będą wskazywane podczas kolejnych ćwiczeń. Kodów QR rejestracji i sekretów uwierzytelniania nie publikujemy.
