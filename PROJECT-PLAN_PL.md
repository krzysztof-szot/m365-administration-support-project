# Plan projektu Microsoft 365 Administration & Support

Aktualizacja: 16 listopada 2026 r.

Etapy 01–06 są COMPLETE; etapy 07–14 pozostają PLANNED. Opublikowano 113 screenów: Day 01 — 31, Day 02 — 21, Day 03 — 11, Day 04 — 27, Day 05 — 14, Day 06 — 9. Globalna tabela ma 18 PASS i 14 NOT_RUN. W Day 05 doszły T11–T13, w Day 06 T14–T15; fazy kontrolne i odzyskanie nie tworzą dodatkowych numerów testów. Dziewięć przypadków M365-001–009 jest rozwiązanych jako ćwiczenia laboratoryjne.

Zweryfikowano pocztę z zewnętrznym Gmail, zapis i ponowne otwarcie dokumentów OneDrive/SharePoint, trwałość wiadomości Teams oraz odmowę panelu administracyjnego dla Anny. Politykę MFA oceniono w Report-only, włączono i uzyskano Success z istniejącym claimem MFA. Świeże zatwierdzenie push nie zostało uchwycone. Dodatkową rolę CA usunięto; właściciel potwierdził dalszy dostęp adm-lab oraz nowe logowania i aktywny Global Administrator dla obu kont awaryjnych.

## Zakończone Day 02 i Day 03

Utworzono Piotra i Marka; po kontrolowanym braku licencji przywrócono Piotrowi pocztę i sprawdzono wymianę wiadomości. Department i Job title zgłoszono jako uzupełnione; zgodnie z decyzją właściciela bez screenów 04a/04b. Grupę MFA rozszerzono do trzech osób, a wyniki polityki są Success. Nie uchwycono nowej metody zatwierdzenia ani pola Authentication requirement dla obu nowych użytkowników.

Powstała prywatna grupa BFL-M365-Finance: właścicielka Anna, członkowie Anna i Piotr, link do witryny, bez Teams. Listę DL-M365-Finance sprawdzono funkcjonalnie; nadawcą był Marek spoza członkostwa. Po usunięciu Piotra bezpośrednia poczta nadal działała, a kopii z listy nie otrzymał przez 10 minut. Przywrócenie członkostwa odtworzyło dostarczanie do obu odbiorców.

Alias m365.finance prowadzi do istniejącej skrzynki Anny. Pierwsza próba wewnętrzna pokazała w nagłówku adres podstawowy; dopiero para wysłane/odebrane z Gmaila potwierdziła jawnie adres aliasu. Surowe nagłówki pozostają prywatne. Rola Exchange Recipient Administrator na adm-lab pozostaje Direct/Active/Permanent do kolejnych zadań odbiorców i wymaga późniejszego przeglądu.

Pierwsze cztery jednostki nauki wykonano 14 listopada 2026 r.; Etapy 05–06 wykonano 16 listopada. Rozpiska godzin w [roadmapie](docs/roadmap.md) jest szacunkiem, a nie pomiarem czasu.

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

Zbuduj zespół Finance z kanałem standardowym i prywatnym. Sprawdź członkostwo oraz bezpośredni dostęp do plików. Odszukaj witrynę główną i witrynę kanału prywatnego. Przećwicz spotkanie, urządzenia audio i udostępnianie ekranu.

Szczegółowe zadania i warunki zakończenia: [etap 07](docs/stages/07-teams-and-connected-sites.md).

### 08. SharePoint i udostępnianie — dzień 14–16

Zbuduj witrynę wiedzy, bibliotekę i proste metadane. Sprawdź Owners, Members i Visitors, dziedziczenie na wydzielonym zasobie oraz linki Specific people. Wyjaśnij dostęp pozostający po usunięciu pojedynczego linku.

Szczegółowe zadania i warunki zakończenia: [etap 08](docs/stages/08-sharepoint-and-sharing.md).

### 09. OneDrive i odzyskiwanie — dzień 17–18

Poznaj Files On-Demand, wstrzymaną synchronizację, historię wersji i kosz. Przywróć syntetyczny plik oraz porównaj rzeczywistą treść z wersją wzorcową w przeglądarce i kliencie.

Szczegółowe zadania i warunki zakończenia: [etap 09](docs/stages/09-onedrive-sync-and-recovery.md).

### 10. Support i instrukcje — dzień 19–20

Zgłoszenia prowadź od początku projektu. Tutaj uporządkuj wpływ, pilność, eskalację, Service health i Message center. Przygotuj trzy instrukcje użytkownika, w tym niemiecki odpowiednik jednej z nich.

Szczegółowe zadania i warunki zakończenia: [etap 10](docs/stages/10-support-operations-and-knowledge.md).

### 11. Raporty PowerShell — dzień 21–23

Zbuduj trzy małe raporty tylko do odczytu: licencje, delegacje skrzynek i członkostwo grup. Określ uprawnienia, filtr do labu i obsługę błędów. Porównaj wiersze z portalem; surowe CSV zapisuj lokalnie.

Szczegółowe zadania i warunki zakończenia: [etap 11](docs/stages/11-powershell-reporting.md).

### 12. Cykl życia pracownika — dzień 24–25

Przeprowadź onboarding, zmianę działu i offboarding Piotra według własnej checklisty. Sprawdź nadany i odebrany dostęp. Zaplanuj przekazanie danych przed zmianą licencji. Zweryfikuj konwersję skrzynki, warunki licencyjne i zachowanie zablokowanego konta kotwiczącego.

Szczegółowe zadania i warunki zakończenia: [etap 12](docs/stages/12-employee-lifecycle.md).

### 13. Sprawdzian samodzielności — dzień 26–27

Rozwiąż pięć zadań na podstawie objawów, bez podanej sekwencji naprawy. Korzystaj ze swoich notatek i oficjalnej dokumentacji. Uzasadnij diagnozę, zakres zmiany, możliwość cofnięcia i sprawdzenie wyniku albo eskalację.

Szczegółowe zadania i warunki zakończenia: [etap 13](docs/stages/13-independent-capstone.md).

### 14. Portfolio i zakończenie labu — dzień 28–30

Zapisuj dowody na bieżąco. Ostatnie dni zostaw na poprawki, eksport materiałów i opis stanu końcowego przed wygaśnięciem triala. Sprawdź zgodność README, wyników i ograniczeń z rzeczywistymi obserwacjami.

Szczegółowe zadania i warunki zakończenia: [etap 14](docs/stages/14-portfolio-and-lab-closure.md).

## Docelowy rezultat

- 15 opisanych zgłoszeń syntetycznych.
- 32 sprawdzenia funkcjonalne, także odmowy dostępu i odzyskanie.
- Trzy raporty PowerShell tylko do odczytu.
- Instrukcje użytkownika, w tym jeden niemiecki odpowiednik.
- Zweryfikowany runbook cyklu życia i pięć samodzielnych zadań końcowych.

To cele całego projektu. Etapy 01–06 są COMPLETE, a etapy 07–14 pozostają PLANNED. Publikowane wyniki muszą odpowiadać zapisanym obserwacjom i dowodom; przypisanie licencji lub utworzenie pliku nie kończy etapu.

W Day 01 wdrożono ograniczony pilot MFA przez Conditional Access w istniejącym tenancie. Windows 11, Chrome 157.0.8103.52 dla Anny i Edge 157.0.4341.46 dla administratorów zapisano na podstawie raportu właściciela. Service health pokazało pięć advisories dla Microsoft 365 suite; nie wnioskujemy z tego o zdrowiu wszystkich usług ani o odtworzonym incydencie. Licencje Premium umożliwiają rozszerzenia z Intune. Dodatkowy [pilot Copilot](docs/copilot-pilot-plan.md) obejmuje trzy sesje, około 5–7 godzin, zintegrowane z etapami 06, 08, 10 i 13; mamy jedno miejsce Copilot. Własna domena i udostępnienie zewnętrzne pozostają rozszerzeniami. PIM, pełne odtworzenie E5/Entra Suite, hybrydowy Exchange, Teams Phone i zaawansowane holdy są poza zakresem podstawowym.

## Start

Przejrzyj [wyniki](tests/README.md), [przypadki](tickets/README.md) i [baseline](docs/01-environment-baseline.md), a następnie rozpocznij [etap 07](docs/stages/07-teams-and-connected-sites.md). Rzeczywiste dane logowania, domenę, identyfikatory, termin triala i szczegóły rozliczeń przechowuj prywatnie. Źródła techniczne i licencyjne: [Microsoft](docs/sources.md).

## Screeny podczas ćwiczeń

Przed istotnym punktem dowodowym prowadzący wskazuje moment wykonania screena, widok i nazwę pliku. Zgodnie z ustaleniem z Day 05 ograniczamy liczbę obrazów do potrzebnej konfiguracji i wyników; pomocnicze odczyty mogą być potwierdzone tekstowo z jawnym przypisaniem źródła. [Indeks dowodów](evidence/README.md) opisuje 113 opublikowanych obrazów. W obrazach Day 03 zanonimizowano wskazane identyfikatory, domenę oraz nazwisko zewnętrznego nadawcy; ograniczenia interpretacji opisano w indeksie. W Day 04 podmieniono 02 na wersję z zasłoniętą domeną, a zapisane wyniki odróżniają konfigurację, fakty widoczne na screenach i potwierdzenia właściciela. Nazwy i moment wykonania nowych dowodów będą wskazywane podczas kolejnych ćwiczeń. Kodów QR rejestracji i sekretów uwierzytelniania nie publikujemy.
