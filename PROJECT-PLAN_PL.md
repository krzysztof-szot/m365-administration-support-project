# Plan projektu Microsoft 365 Administration & Support

Aktualizacja: 14 listopada 2026 r.

Etapy 01–03 są COMPLETE; etapy 04–14 pozostają PLANNED. Opublikowano 63 screeny: 31 w Day 01, 21 w Day 02 i 11 w Day 03. Globalna tabela ma 7 PASS i 25 NOT_RUN: T01, T02, T03, T04, T05, T06 oraz T16. T06 ma jeden wpis mimo testów w dwóch etapach. Trzy przypadki M365-001–003 są rozwiązane jako ćwiczenia laboratoryjne.

Zweryfikowano pocztę z zewnętrznym Gmail, zapis i ponowne otwarcie dokumentów OneDrive/SharePoint, trwałość wiadomości Teams oraz odmowę panelu administracyjnego dla Anny. Politykę MFA oceniono w Report-only, włączono i uzyskano Success z istniejącym claimem MFA. Świeże zatwierdzenie push nie zostało uchwycone. Dodatkową rolę CA usunięto; właściciel potwierdził dalszy dostęp adm-lab oraz nowe logowania i aktywny Global Administrator dla obu kont awaryjnych.

## Zakończone Day 02 i Day 03

Utworzono Piotra i Marka; po kontrolowanym braku licencji przywrócono Piotrowi pocztę i sprawdzono wymianę wiadomości. Department i Job title zgłoszono jako uzupełnione; zgodnie z decyzją właściciela bez screenów 04a/04b. Grupę MFA rozszerzono do trzech osób, a wyniki polityki są Success. Nie uchwycono nowej metody zatwierdzenia ani pola Authentication requirement dla obu nowych użytkowników.

Powstała prywatna grupa BFL-M365-Finance: właścicielka Anna, członkowie Anna i Piotr, link do witryny, bez Teams. Listę DL-M365-Finance sprawdzono funkcjonalnie; nadawcą był Marek spoza członkostwa. Po usunięciu Piotra bezpośrednia poczta nadal działała, a kopii z listy nie otrzymał przez 10 minut. Przywrócenie członkostwa odtworzyło dostarczanie do obu odbiorców.

Alias m365.finance prowadzi do istniejącej skrzynki Anny. Pierwsza próba wewnętrzna pokazała w nagłówku adres podstawowy; dopiero para wysłane/odebrane z Gmaila potwierdziła jawnie adres aliasu. Surowe nagłówki pozostają prywatne. Rola Exchange Recipient Administrator na adm-lab pozostaje Direct/Active/Permanent do kolejnych zadań odbiorców i wymaga późniejszego przeglądu.

Wszystkie trzy jednostki nauki wykonano 14 listopada 2026 r. Rozpiska godzin w [roadmapie](docs/roadmap.md) jest szacunkiem, a nie pomiarem czasu.

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

Utwórz Helpdesk oraz skrzynkę sali. Oddzielnie sprawdź Full Access, Send As i Send on Behalf. Przetestuj czytelnika kalendarza i konflikt rezerwacji sali.

Szczegółowe zadania i warunki zakończenia: [etap 04](docs/stages/04-delegation-calendars-and-rooms.md).

### 05. Przepływ poczty — dzień 8–9

Zbieraj dane zgłoszenia, NDR i Message Trace. Porównaj nieistniejącego odbiorcę z odrzuceniem przez kontrolowaną regułę ograniczoną do oznaczonej wiadomości i odbiorcy testowego. Zweryfikuj naprawę i wiadomość kontrolną.

Szczegółowe zadania i warunki zakończenia: [etap 05](docs/stages/05-mail-flow-troubleshooting.md).

### 06. Outlook i Office — dzień 10–11

W osobnym profilu lub VM zbadaj aktywację aplikacji, niewłaściwą tożsamość oraz różnicę przeglądarka–klient. Udokumentuj wersję Outlooka. Ustal, czy problem dotyczy konta, licencji, usługi czy klienta.

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

To cele całego projektu. Etapy 01–03 są COMPLETE, a etapy 04–14 pozostają PLANNED. Publikowane wyniki muszą odpowiadać zapisanym obserwacjom i dowodom; przypisanie licencji lub utworzenie pliku nie kończy etapu.

W Day 01 wdrożono ograniczony pilot MFA przez Conditional Access w istniejącym tenancie. Windows 11, Chrome 157.0.8103.52 dla Anny i Edge 157.0.4341.46 dla administratorów zapisano na podstawie raportu właściciela. Service health pokazało pięć advisories dla Microsoft 365 suite; nie wnioskujemy z tego o zdrowiu wszystkich usług ani o odtworzonym incydencie. Licencje Premium umożliwiają rozszerzenia z Intune. Dodatkowy [pilot Copilot](docs/copilot-pilot-plan.md) obejmuje trzy sesje, około 5–7 godzin, zintegrowane z etapami 06, 08, 10 i 13; mamy jedno miejsce Copilot. Własna domena i udostępnienie zewnętrzne pozostają rozszerzeniami. PIM, pełne odtworzenie E5/Entra Suite, hybrydowy Exchange, Teams Phone i zaawansowane holdy są poza zakresem podstawowym.

## Start

Przejrzyj [wyniki](tests/README.md), [przypadki](tickets/README.md) i [baseline](docs/01-environment-baseline.md), a następnie rozpocznij [etap 04](docs/stages/04-delegation-calendars-and-rooms.md). Rzeczywiste dane logowania, domenę, identyfikatory, termin triala i szczegóły rozliczeń przechowuj prywatnie. Źródła techniczne i licencyjne: [Microsoft](docs/sources.md).

## Screeny podczas ćwiczeń

Przy każdym istotnym kroku prowadzący wskazuje moment wykonania screena, widok i nazwę pliku. [Indeks dowodów](evidence/README.md) opisuje 63 opublikowane screeny. W obrazach Day 03 zanonimizowano wskazane identyfikatory, domenę oraz nazwisko zewnętrznego nadawcy; ograniczenia interpretacji opisano w indeksie. Nazwy i moment wykonania nowych dowodów będą wskazywane podczas kolejnych ćwiczeń. Kodów QR rejestracji i sekretów uwierzytelniania nie publikujemy.
