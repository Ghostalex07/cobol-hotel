# 🏨 Hotel Cobol 

```
################################################################
##                                                            ##
##        H O T E L   C O B O L   P A L A C E               ##
##           Luxury, comfort and COBOL technology             ##
##                 Madrid, Spain  --  * * * * *               ##
##                        v2.0 - 2026                         ##
##                                                            ##
################################################################
```

> **Full Hotel Management System** written entirely in COBOL (free format, GnuCOBOL 3.x).
> 3,067 lines. No external dependencies. Runs in any terminal.

---

## Build & Run

```bash
# Compile
cobc -x -free hotel.cob -o hotel

# Run
./hotel
```

Requires **GnuCOBOL 3.x**:

```bash
# Debian / Ubuntu / Kali
sudo apt install gnucobol

# macOS (Homebrew)
brew install gnu-cobol

# Fedora / RHEL
sudo dnf install gnucobol
```

---

## Overview

The system boots into a **welcome screen** showing real-time hotel status: free / occupied / maintenance rooms, active reservations, and registered clients. The main menu gives access to 8 fully functional modules.

---

## Modules

### 1. Reservations
- Create a new reservation with full automatic pricing
- Room supplement by meal plan (SA / AD / MP / PC)
- Children supplement (50% of adult meal plan rate)
- VIP client discounts — Gold 12%, Plus 7%
- IVA (10%) always shown as a separate line
- View, modify, cancel any reservation
- List all active / pending reservations
- Search reservations by client ID

### 2. Check-In / Check-Out
- Check-in updates room state and increments guest stay counter
- Displays VIP notes at arrival (e.g. "High floor requested", "Latex allergy")
- Check-out generates a full itemised final invoice
- All room services consumed are included in the checkout bill
- Payment methods: cash (EF), card (TC), transfer (TR), direct billing (DB)
- Today's arrivals and departures at a glance

### 3. Hotel Board
- Visual room-by-room layout, organised by floor (1–5)
- State labels: `[ LIBRE ]` · `[OCUPADA]` · `[ MANT. ]`
- Shows price per night, capacity, view, and active reservation ID
- Real-time occupancy percentage

### 4. Room Management
- Full room profile: number, floor, type, price, capacity, view, amenities, accessibility flag
- Change room state (Free / Maintenance)
- Update nightly rate
- List all available rooms
- Filter rooms by type code

### 5. Room Services
- Catalogue of **14 services** with unit price and unit type:

| Code | Service | Price |
|------|---------|-------|
| RM | Room Service (dish) | €28 |
| MM | Minibar (item) | €9 |
| SP | SPA (session) | €50 |
| MS | Relaxing massage | €70 |
| GI | Gym (day) | €15 |
| LA | Laundry (item) | €7 |
| AP | Parking (day) | €22 |
| TR | Airport transfer | €60 |
| TO | Madrid city tour | €40 |
| BK | Premium wine / cava | €45 |
| FT | Flowers & decoration | €35 |
| CB | Baby cot (night) | €15 |
| RS | Babysitter service (hr) | €25 |
| PR | International press | €5 |

- Register charge against any active reservation (catalogue item or free-text)
- Set quantity per charge
- View full service log per reservation (date, time, description, amount)
- Undo the last charge

### 6. Clients & Loyalty
- Full client registration: name, surname, document, phone, email, country, language, notes
- Quick registration inline during the booking flow
- Edit contact details with PIN-free update
- Search by name prefix, document number, or country
- **Loyalty tiers** updated automatically at every checkout:

| Tier | Minimum lifetime spend | Booking discount |
|------|----------------------|----------------|
| Normal | < €2,000 | — |
| Plus ⭐ | ≥ €2,000 | 7% |
| Gold ⭐⭐ | ≥ €8,000 | 12% |

- Points: **1 point per €10 spent**
- Redeem points (minimum 100 pts = €10 discount)
- VIP-only list (Gold & Plus clients)
- Full fidelity ranking: stays, total nights, lifetime spend

### 7. Billing & Cash Desk
- Issue a full itemised invoice for any reservation
- Partial payment registration — tracks paid / outstanding amounts
- List all unpaid or partially paid reservations
- Daily cash desk closure: reservations collected, services billed, total takings
- Global revenue summary: billed, collected, outstanding, services income

### 8. Reports & Statistics

| # | Report | What it shows |
|---|--------|--------------|
| 1 | Executive | Occupancy %, total billings, collected amount, VIP count |
| 2 | Occupancy | Breakdown by room type (Individual / Double / Suite / Suite Premium / Penthouse) |
| 3 | Revenue by room type | Reservations and income per type |
| 4 | Revenue by meal plan | SA, AD, MP, PC reservations and income |
| 5 | Client statistics | Totals, Gold/Plus counts, average spend, top countries |
| 6 | Top services | Units sold and revenue per service code |
| 7 | Sales channels | Reservations and income by channel (front desk, web, agency, phone, app) |

---

## Pre-loaded Data

### Rooms (20 total across 5 floors)

| Floor | Room | Type | €/night | Cap. | View |
|-------|------|------|---------|------|------|
| 1 | 101 | Individual Classic | 89 | 1 | Patio |
| 1 | 102 | Double Standard | 125 | 2 | Patio |
| 1 | 103 | Double Superior *(occupied)* | 155 | 2 | Gran Vía |
| 1 | 104 | Double Accessible | 125 | 2 | Garden |
| 1 | 105 | Individual Plus | 99 | 1 | Side street |
| 1 | 106 | Romantic Double | 165 | 2 | Romantic garden |
| 2 | 201 | Double Deluxe *(occupied)* | 185 | 2 | Panoramic Gran Vía |
| 2 | 202 | Double Deluxe | 185 | 2 | Garden & pool |
| 2 | 203 | Family | 210 | 4 | Garden |
| 2 | 204 | Family Premium | 240 | 5 | Gran Vía |
| 2 | 205 | Double Standard | 125 | 2 | Patio |
| 3 | 301 | Junior Suite | 295 | 2 | Madrid skyline |
| 3 | 302 | Suite *(occupied)* | 350 | 2 | Royal Palace |
| 3 | 303 | Suite Gran Vía | 380 | 3 | 180° Gran Vía |
| 3 | 304 | Family Suite | 420 | 4 | Retiro Park |
| 4 | 401 | Premium Suite | 480 | 3 | Madrid panoramic |
| 4 | 402 | Premium Suite *(maintenance)* | 480 | 3 | Sierra de Guadarrama |
| 4 | 403 | Presidential Suite | 650 | 4 | 360° Madrid |
| 5 | 501 | Penthouse Classic | 850 | 4 | 360° Madrid |
| 5 | 502 | Penthouse VIP | 1,200 | 6 | Full Madrid |

### Clients (5 pre-loaded)

| ID | Name | Country | Tier | Stays |
|----|------|---------|------|-------|
| 5001 | Elena Garcia Ramirez | Spain | Gold ⭐⭐ | 18 |
| 5002 | William Johnson | United States | Plus ⭐ | 4 |
| 5003 | Hans Mueller | Germany | Plus ⭐ | 6 |
| 5004 | Yuki Tanaka | Japan | Normal | 1 |
| 5005 | Marie Dupont | France | Normal | 0 |

### Active Reservations (4 pre-loaded)

| ID | Room | Guest | Dates | Meal Plan | Total |
|----|------|-------|-------|-----------|-------|
| 10001 | 103 | Elena Garcia | 13–17 Mar | AD | €716.32 |
| 10002 | 201 | Hans Mueller | 11–15 Mar | PC | €1,352.56 |
| 10003 | 302 | William Johnson | 12–14 Mar | MP | €937.60 |
| 10004 | 303 | Marie Dupont | 13–18 Mar | PC | €2,750.00 |

---

## Capacities

| Table | Max records |
|-------|------------|
| Rooms | 20 |
| Clients | 50 |
| Reservations | 60 |
| Room service charges | 150 |
| Service catalogue entries | 14 |

---

## Code Structure

```
hotel_elite.cbl                  Single-file COBOL source
│
├── IDENTIFICATION DIVISION
├── ENVIRONMENT DIVISION
│
├── DATA DIVISION
│   ├── TBL-HAB              Rooms (OCCURS 20)
│   ├── TBL-CLI              Clients (OCCURS 50)
│   ├── TBL-RES              Reservations (OCCURS 60)
│   ├── TBL-SVC              Service charges (OCCURS 150)
│   └── TBL-CAT              Service catalogue (OCCURS 14)
│
└── PROCEDURE DIVISION
    ├── MAIN                 Entry point
    ├── BIENVENIDA           Welcome / splash screen
    ├── MENU-PPAL            Main menu loop (UNTIL W-OP = 9)
    │
    ├── MENU-RESERVAS        Module 1 – Reservations
    │   ├── RES-NUEVA        New reservation + pricing engine
    │   ├── RES-CONSULTAR    View reservation details
    │   ├── RES-MODIFICAR    Edit dates / notes / recalculate
    │   ├── RES-CANCELAR     Cancel + free room
    │   ├── RES-LISTAR       List active/pending
    │   └── RES-BUSCAR-CLI   Search by client
    │
    ├── MENU-CHECKIN         Module 2 – Check-In / Check-Out
    │   ├── HACER-CHECKIN    Arrival processing
    │   ├── HACER-CHECKOUT   Departure + final invoice
    │   ├── VER-HUESPEDES    Current guests
    │   ├── LLEGADAS-HOY     Today's arrivals
    │   └── SALIDAS-HOY      Today's departures
    │
    ├── CUADRO-HOTEL         Module 3 – Visual hotel board
    │
    ├── MENU-HAB             Module 4 – Room management
    │
    ├── MENU-SVC             Module 5 – Room services
    │   ├── SVC-REGISTRAR    Add charge (catalogue or free-text)
    │   ├── SVC-VER          View charges per reservation
    │   ├── SVC-CATALOGO     Print full catalogue
    │   └── SVC-ANULAR       Undo last charge
    │
    ├── MENU-CLI             Module 6 – Clients & loyalty
    │   ├── CLI-ALTA         Full registration
    │   ├── CLI-ALTA-RAPIDA  Quick inline registration
    │   ├── CLI-FICHA        Full profile view
    │   ├── CLI-EDITAR       Edit contact + notes
    │   ├── CLI-BUSCAR       Search (name / doc / country)
    │   ├── CLI-VIP          Gold & Plus list
    │   ├── CLI-CANJEAR      Redeem loyalty points
    │   └── CLI-RANKING      Fidelity ranking
    │
    ├── MENU-FAC             Module 7 – Billing & cash desk
    │   ├── FAC-EMITIR       Full itemised invoice
    │   ├── FAC-PAGO-PARCIAL Partial payment
    │   ├── FAC-PENDIENTES   Outstanding payments
    │   ├── FAC-CIERRE       Daily cash desk closure
    │   └── FAC-RESUMEN      Global revenue summary
    │
    ├── MENU-INF             Module 8 – Reports
    │   ├── INF-EJECUTIVO    Executive dashboard
    │   ├── INF-OCUPACION    Occupancy breakdown
    │   ├── INF-POR-TIPO-HAB Revenue by room type
    │   ├── INF-POR-REGIMEN  Revenue by meal plan
    │   ├── INF-CLIENTES     Client statistics
    │   ├── INF-SERVICIOS    Top services
    │   └── INF-CANALES      Sales channel breakdown
    │
    ├── BUSCAR-HAB           Helper: find room by number
    ├── BUSCAR-RES           Helper: find reservation by ID
    ├── BUSCAR-CLI           Helper: find client by ID
    ├── LIBERAR-HAB-RES      Helper: free room on cancel/checkout
    ├── ACTUALIZAR-CLIENTE-CHECKOUT  Helper: update points & tier
    │
    └── CARGAR-DEMO          Loads all pre-loaded demo data
```

---

## Technical Notes

- All data is **in-memory only** — nothing persists to disk between runs. Demo data reloads fresh on every execution.
- Prices are in **EUR**. IVA (10%) is always calculated and displayed as a separate line item.
- The source uses **COBOL free format** (`>>SOURCE FORMAT FREE`), meaning the classic column-based layout rules do not apply. Always compile with the `-free` flag.
- Tested on **GnuCOBOL 3.1.2** (Ubuntu 24.04 LTS).
- Single-file architecture — the entire system lives in `hotel_elite.cbl` with no includes or copybooks.

---

## Also in This COBOL Series

| File | Description |
|------|-------------|
| `banco_pro.cbl` | Full banking system — accounts, loans, credit cards, transfers, FX exchange |
| `hotel_elite.cbl` | This file — hotel management system |

---

## License

Free to use, study, and modify. Built for educational and portfolio purposes.

> *"The best language is the one that still runs the world's financial infrastructure."*
> — Anonymous COBOL developer, circa 1975
