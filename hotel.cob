>>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. HOTEL-ELITE.
AUTHOR. HotelCobol Pro.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. GNU-COBOL.
OBJECT-COMPUTER. GNU-COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.

*> ---------------------------------------------------------------
*> CONFIGURACION
*> ---------------------------------------------------------------
01 CFG-NOMBRE            PIC X(28)   VALUE "HOTEL COBOL PALACE".
01 CFG-ESLOGAN           PIC X(35)   VALUE "Lujo, confort y tecnologia COBOL".
01 CFG-CIUDAD            PIC X(18)   VALUE "Madrid, Espana".
01 CFG-STARS             PIC X(13)   VALUE "* * * * *".
01 CFG-VERSION           PIC X(12)   VALUE "v2.0 - 2026".
01 CFG-MAX-HAB           PIC 9(3)    VALUE 20.
01 CFG-MAX-RES           PIC 9(3)    VALUE 60.
01 CFG-MAX-CLI           PIC 9(3)    VALUE 50.
01 CFG-MAX-SVC           PIC 9(3)    VALUE 150.
01 CFG-MAX-CAT           PIC 9(2)    VALUE 14.
01 CFG-IVA               PIC 9V9(4)  VALUE 0.1000.
01 CFG-RETIRO-MIN-DIA    PIC 9(2)    VALUE 1.
01 CFG-MAX-NOCHES        PIC 9(3)    VALUE 90.

*> ---------------------------------------------------------------
*> TABLA HABITACIONES
*> ---------------------------------------------------------------
01 TBL-HAB.
   05 H OCCURS 20 TIMES.
      10 H-NUM             PIC 9(3)      VALUE ZEROS.
      10 H-PLANTA          PIC 9(1)      VALUE ZEROS.
      10 H-TIPO            PIC X(2)      VALUE SPACES.
      10 H-TIPO-NOMBRE     PIC X(20)     VALUE SPACES.
      10 H-PRECIO          PIC 9(6)V99   VALUE ZEROS.
      10 H-CAP             PIC 9(1)      VALUE ZEROS.
      10 H-ESTADO          PIC X(1)      VALUE "L".
      10 H-DESC            PIC X(45)     VALUE SPACES.
      10 H-RES-ID          PIC 9(5)      VALUE ZEROS.
      10 H-FUMADOR         PIC X(1)      VALUE "N".
      10 H-ACCESIBLE       PIC X(1)      VALUE "N".
      10 H-VISTA           PIC X(15)     VALUE SPACES.
      10 H-AMENITIES       PIC X(30)     VALUE SPACES.

*> ---------------------------------------------------------------
*> TABLA CLIENTES
*> ---------------------------------------------------------------
01 TBL-CLI.
   05 C OCCURS 50 TIMES.
      10 C-ID              PIC 9(5)      VALUE ZEROS.
      10 C-NOMBRE          PIC X(35)     VALUE SPACES.
      10 C-APELLIDOS       PIC X(30)     VALUE SPACES.
      10 C-NOMBRE-COMP     PIC X(50)     VALUE SPACES.
      10 C-DOC             PIC X(15)     VALUE SPACES.
      10 C-TEL             PIC X(14)     VALUE SPACES.
      10 C-EMAIL           PIC X(40)     VALUE SPACES.
      10 C-PAIS            PIC X(22)     VALUE SPACES.
      10 C-IDIOMA          PIC X(10)     VALUE SPACES.
      10 C-CAT             PIC X(1)      VALUE "N".
      10 C-PUNTOS          PIC 9(7)      VALUE ZEROS.
      10 C-ESTANCIAS       PIC 9(4)      VALUE ZEROS.
      10 C-GASTO           PIC 9(10)V99  VALUE ZEROS.
      10 C-NOCHES-TOTAL    PIC 9(5)      VALUE ZEROS.
      10 C-ACTIVO          PIC X(1)      VALUE "S".
      10 C-FECHA-ALTA      PIC X(10)     VALUE SPACES.
      10 C-OBSERVACIONES   PIC X(40)     VALUE SPACES.

*> ---------------------------------------------------------------
*> TABLA RESERVAS
*> ---------------------------------------------------------------
01 TBL-RES.
   05 R OCCURS 60 TIMES.
      10 R-ID              PIC 9(5)      VALUE ZEROS.
      10 R-HAB             PIC 9(3)      VALUE ZEROS.
      10 R-CLI-ID          PIC 9(5)      VALUE ZEROS.
      10 R-NOMBRE-CLI      PIC X(50)     VALUE SPACES.
      10 R-ENTRADA         PIC X(10)     VALUE SPACES.
      10 R-SALIDA          PIC X(10)     VALUE SPACES.
      10 R-NOCHES          PIC 9(3)      VALUE ZEROS.
      10 R-ADULTOS         PIC 9(2)      VALUE ZEROS.
      10 R-NINOS           PIC 9(2)      VALUE ZEROS.
      10 R-BEBES           PIC 9(2)      VALUE ZEROS.
      10 R-REGIMEN         PIC X(2)      VALUE "SA".
      10 R-PRECIO-HAB      PIC 9(6)V99   VALUE ZEROS.
      10 R-BASE-HAB        PIC 9(8)V99   VALUE ZEROS.
      10 R-SUPL-REGIMEN    PIC 9(6)V99   VALUE ZEROS.
      10 R-SUPL-EXTRA      PIC 9(6)V99   VALUE ZEROS.
      10 R-DESCUENTO       PIC 9(6)V99   VALUE ZEROS.
      10 R-IMPORTE-SVC     PIC 9(8)V99   VALUE ZEROS.
      10 R-BASE-IMPONIBLE  PIC 9(8)V99   VALUE ZEROS.
      10 R-IVA             PIC 9(6)V99   VALUE ZEROS.
      10 R-TOTAL           PIC 9(8)V99   VALUE ZEROS.
      10 R-PAGADO          PIC 9(8)V99   VALUE ZEROS.
      10 R-PENDIENTE       PIC 9(8)V99   VALUE ZEROS.
      10 R-ESTADO          PIC X(1)      VALUE "P".
      10 R-PAGADA          PIC X(1)      VALUE "N".
      10 R-CANAL           PIC X(10)     VALUE "MOSTRADOR".
      10 R-NOTAS           PIC X(50)     VALUE SPACES.
      10 R-FECHA-RES       PIC X(10)     VALUE SPACES.
      10 R-FORMA-PAGO      PIC X(10)     VALUE SPACES.

*> ---------------------------------------------------------------
*> TABLA SERVICIOS
*> ---------------------------------------------------------------
01 TBL-SVC.
   05 S OCCURS 150 TIMES.
      10 S-ID              PIC 9(5)      VALUE ZEROS.
      10 S-RES-ID          PIC 9(5)      VALUE ZEROS.
      10 S-HAB             PIC 9(3)      VALUE ZEROS.
      10 S-COD             PIC X(2)      VALUE SPACES.
      10 S-DESC            PIC X(40)     VALUE SPACES.
      10 S-CANT            PIC 9(3)      VALUE ZEROS.
      10 S-PU              PIC 9(5)V99   VALUE ZEROS.
      10 S-TOTAL           PIC 9(7)V99   VALUE ZEROS.
      10 S-FECHA           PIC X(10)     VALUE SPACES.
      10 S-HORA            PIC X(5)      VALUE SPACES.

*> ---------------------------------------------------------------
*> CATALOGO SERVICIOS
*> ---------------------------------------------------------------
01 TBL-CAT.
   05 K OCCURS 14 TIMES.
      10 K-COD             PIC X(2)      VALUE SPACES.
      10 K-NOMBRE          PIC X(28)     VALUE SPACES.
      10 K-PRECIO          PIC 9(5)V99   VALUE ZEROS.
      10 K-UNIDAD          PIC X(12)     VALUE SPACES.

*> ---------------------------------------------------------------
*> CONTADORES GLOBALES
*> ---------------------------------------------------------------
01 G-N-HAB               PIC 9(3)    VALUE ZEROS.
01 G-N-CLI               PIC 9(3)    VALUE ZEROS.
01 G-N-RES               PIC 9(3)    VALUE ZEROS.
01 G-N-SVC               PIC 9(4)    VALUE ZEROS.
01 G-ID-RES              PIC 9(5)    VALUE 10000.
01 G-ID-CLI              PIC 9(5)    VALUE 5000.
01 G-ID-SVC              PIC 9(5)    VALUE 20000.

*> ---------------------------------------------------------------
*> SESION
*> ---------------------------------------------------------------
01 SES-FECHA             PIC X(10)   VALUE "2026-03-13".
01 SES-HORA              PIC X(5)    VALUE "10:30".
01 SES-TURNO             PIC X(12)   VALUE "MANANA".
01 SES-RECEP             PIC X(22)   VALUE "Carmen Rodriguez".
01 SES-OPS               PIC 9(4)    VALUE ZEROS.

*> ---------------------------------------------------------------
*> TRABAJO
*> ---------------------------------------------------------------
01 W-OP                  PIC 9(1)    VALUE ZEROS.
01 W-SUB                 PIC 9(1)    VALUE ZEROS.
01 W-ERR                 PIC X(1)    VALUE "N".
01 W-ENC                 PIC X(1)    VALUE "N".
01 W-I                   PIC 9(3)    VALUE ZEROS.
01 W-J                   PIC 9(3)    VALUE ZEROS.
01 W-K                   PIC 9(3)    VALUE ZEROS.
01 W-M                   PIC 9(3)    VALUE ZEROS.
01 W-CNT                 PIC 9(4)    VALUE ZEROS.
01 W-CNT2                PIC 9(4)    VALUE ZEROS.
01 W-CNT3                PIC 9(4)    VALUE ZEROS.
01 W-ACUM                PIC 9(12)V99 VALUE ZEROS.
01 W-ACUM2               PIC 9(12)V99 VALUE ZEROS.
01 W-TEMP                PIC 9(10)V99 VALUE ZEROS.
01 W-TEMP2               PIC 9(10)V99 VALUE ZEROS.
01 W-TEMP3               PIC 9(10)V99 VALUE ZEROS.
01 W-RESP                PIC X(1)    VALUE SPACES.
01 W-RESP2               PIC X(1)    VALUE SPACES.
01 W-TXT                 PIC X(50)   VALUE SPACES.
01 W-TXT2                PIC X(50)   VALUE SPACES.
01 W-NUM                 PIC 9(5)    VALUE ZEROS.
01 W-IMP                 PIC 9(8)V99 VALUE ZEROS.
01 W-IDX-H               PIC 9(3)    VALUE ZEROS.
01 W-IDX-C               PIC 9(3)    VALUE ZEROS.
01 W-IDX-R               PIC 9(3)    VALUE ZEROS.
01 W-BUSCAR-H            PIC 9(3)    VALUE ZEROS.
01 W-BUSCAR-R            PIC 9(5)    VALUE ZEROS.
01 W-BUSCAR-C            PIC 9(5)    VALUE ZEROS.

*> inputs nueva reserva
01 NR-HAB                PIC 9(3)    VALUE ZEROS.
01 NR-CLI                PIC 9(5)    VALUE ZEROS.
01 NR-ENT                PIC X(10)   VALUE SPACES.
01 NR-SAL                PIC X(10)   VALUE SPACES.
01 NR-NOC                PIC 9(3)    VALUE ZEROS.
01 NR-ADU                PIC 9(2)    VALUE ZEROS.
01 NR-NIN                PIC 9(2)    VALUE ZEROS.
01 NR-BEB                PIC 9(2)    VALUE ZEROS.
01 NR-REG                PIC X(2)    VALUE SPACES.
01 NR-NOT                PIC X(50)   VALUE SPACES.
01 NR-CAN                PIC X(10)   VALUE SPACES.

*> inputs cliente
01 NC-NOM                PIC X(35)   VALUE SPACES.
01 NC-APE                PIC X(30)   VALUE SPACES.
01 NC-DOC                PIC X(15)   VALUE SPACES.
01 NC-TEL                PIC X(14)   VALUE SPACES.
01 NC-EML                PIC X(40)   VALUE SPACES.
01 NC-PAI                PIC X(22)   VALUE SPACES.
01 NC-IDI                PIC X(10)   VALUE SPACES.
01 NC-OBS                PIC X(40)   VALUE SPACES.

*> display
01 D-IMP                 PIC ZZZ,ZZ9.99.
01 D-IMP2                PIC Z,ZZZ,ZZ9.99.
01 D-IMP3                PIC -ZZZ,ZZ9.99.
01 D-CNT                 PIC ZZZ9.
01 D-CNT2                PIC ZZ9.
01 D-PCT                 PIC Z9.9.
01 D-NOC                 PIC ZZ9.

*> lineas decorativas
01 L-DOBLE  PIC X(68)
   VALUE "================================================================".
01 L-SIMPLE PIC X(68)
   VALUE "----------------------------------------------------------------".
01 L-STARS  PIC X(68)
   VALUE "################################################################".
01 L-PUNTOS PIC X(68)
   VALUE "................................................................".
01 L-BLANK  PIC X(68)   VALUE SPACES.

PROCEDURE DIVISION.
MAIN.
    PERFORM CARGAR-DEMO
    PERFORM BIENVENIDA
    PERFORM MENU-PPAL UNTIL W-OP = 9
    PERFORM DESPEDIDA
    STOP RUN
    .

*> ================================================================
*> PANTALLAS
*> ================================================================
BIENVENIDA.
    DISPLAY " "
    DISPLAY L-STARS
    DISPLAY "##                                                            ##"
    DISPLAY "##        H O T E L   C O B O L   P A L A C E               ##"
    DISPLAY "##             " CFG-ESLOGAN "   ##"
    DISPLAY "##                 " CFG-CIUDAD " -- " CFG-STARS "             ##"
    DISPLAY "##                   " CFG-VERSION "                            ##"
    DISPLAY "##                                                            ##"
    DISPLAY L-STARS
    DISPLAY " "
    DISPLAY "  Recepcionista : " SES-RECEP
    DISPLAY "  Turno         : " SES-TURNO
    DISPLAY "  Fecha / Hora  : " SES-FECHA " -- " SES-HORA
    DISPLAY " "
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT W-CNT2 W-CNT3
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        EVALUATE H-ESTADO(W-I)
            WHEN "L" ADD 1 TO W-CNT
            WHEN "O" ADD 1 TO W-CNT2
            WHEN "M" ADD 1 TO W-CNT3
        END-EVALUATE
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    DISPLAY "  Habitaciones libres   : " D-CNT
    MOVE W-CNT2 TO D-CNT
    DISPLAY "  Habitaciones ocupadas : " D-CNT
    MOVE W-CNT3 TO D-CNT
    DISPLAY "  En mantenimiento      : " D-CNT
    MOVE G-N-RES TO D-CNT
    DISPLAY "  Reservas activas      : " D-CNT
    MOVE G-N-CLI TO D-CNT
    DISPLAY "  Clientes registrados  : " D-CNT
    DISPLAY L-SIMPLE
    DISPLAY " "
    DISPLAY "  Presione ENTER para entrar al sistema..."
    ACCEPT W-TXT
    .

DESPEDIDA.
    DISPLAY " "
    DISPLAY L-STARS
    DISPLAY "##                                                            ##"
    DISPLAY "##     HOTEL COBOL PALACE -- SESION CERRADA                  ##"
    DISPLAY "##     Hasta pronto. Que tenga un buen dia!                  ##"
    DISPLAY "##                                                            ##"
    DISPLAY L-STARS
    MOVE SES-OPS TO D-CNT
    DISPLAY "  Operaciones en sesion: " D-CNT
    DISPLAY " "
    .

*> ================================================================
*> MENU PRINCIPAL
*> ================================================================
MENU-PPAL.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  [" CFG-NOMBRE "]  " CFG-STARS
    DISPLAY L-DOBLE
    MOVE G-N-HAB TO D-CNT
    DISPLAY "  " SES-FECHA " | " SES-HORA
            " | Recep: " SES-RECEP
    MOVE ZEROS TO W-CNT W-CNT2
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-ESTADO(W-I) = "L" ADD 1 TO W-CNT END-IF
        IF H-ESTADO(W-I) = "O" ADD 1 TO W-CNT2 END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    MOVE W-CNT2 TO D-CNT2
    DISPLAY "  Libres: " D-CNT "   Ocupadas: " D-CNT2
    DISPLAY L-SIMPLE
    DISPLAY "  1. Reservas              5. Servicios de Habitacion"
    DISPLAY "  2. Check-In / Check-Out  6. Clientes y Fidelizacion"
    DISPLAY "  3. Cuadro de Habitaciones 7. Facturacion y Caja"
    DISPLAY "  4. Gestion Habitaciones  8. Informes y Estadisticas"
    DISPLAY "                           9. Salir del Sistema"
    DISPLAY L-SIMPLE
    DISPLAY "  >>> Opcion: " WITH NO ADVANCING
    ACCEPT W-OP
    EVALUATE W-OP
        WHEN 1 PERFORM MENU-RESERVAS
        WHEN 2 PERFORM MENU-CHECKIN
        WHEN 3 PERFORM CUADRO-HOTEL
        WHEN 4 PERFORM MENU-HAB
        WHEN 5 PERFORM MENU-SVC
        WHEN 6 PERFORM MENU-CLI
        WHEN 7 PERFORM MENU-FAC
        WHEN 8 PERFORM MENU-INF
        WHEN 9 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion no valida (1-8 o 9)"
    END-EVALUATE
    .

*> ================================================================
*> CUADRO VISUAL DEL HOTEL
*> ================================================================
CUADRO-HOTEL.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CUADRO DE HABITACIONES -- " SES-FECHA
    DISPLAY L-DOBLE
    PERFORM VARYING W-M FROM 1 BY 1 UNTIL W-M > 5
        MOVE ZEROS TO W-CNT
        PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
            IF H-PLANTA(W-I) = W-M
                ADD 1 TO W-CNT
            END-IF
        END-PERFORM
        IF W-CNT > ZEROS
            MOVE W-M TO D-CNT2
            DISPLAY "  PLANTA " D-CNT2
            DISPLAY L-PUNTOS
            PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
                IF H-PLANTA(W-I) = W-M
                    MOVE H-PRECIO(W-I) TO D-IMP
                    EVALUATE H-ESTADO(W-I)
                        WHEN "L"
                            DISPLAY "  [ LIBRE  ] "
                                    H-NUM(W-I)
                                    " " H-TIPO-NOMBRE(W-I)
                                    " -- " D-IMP " EUR/noche"
                                    " | Cap:" H-CAP(W-I)
                                    " | Vista: " H-VISTA(W-I)
                        WHEN "O"
                            DISPLAY "  [OCUPADA ] "
                                    H-NUM(W-I)
                                    " " H-TIPO-NOMBRE(W-I)
                                    " -- " D-IMP " EUR/noche"
                                    " | Res:" H-RES-ID(W-I)
                        WHEN "M"
                            DISPLAY "  [ MANT.  ] "
                                    H-NUM(W-I)
                                    " " H-TIPO-NOMBRE(W-I)
                                    " (Fuera de servicio)"
                        WHEN "L"
                            DISPLAY "  [LIMPIEZA] "
                                    H-NUM(W-I)
                                    " " H-TIPO-NOMBRE(W-I)
                    END-EVALUATE
                END-IF
            END-PERFORM
            DISPLAY " "
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT W-CNT2 W-CNT3
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-ESTADO(W-I) = "L" ADD 1 TO W-CNT  END-IF
        IF H-ESTADO(W-I) = "O" ADD 1 TO W-CNT2 END-IF
        IF H-ESTADO(W-I) = "M" ADD 1 TO W-CNT3 END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    MOVE W-CNT2 TO D-CNT2
    DISPLAY "  TOTAL -- Libres: " D-CNT "  Ocupadas: " D-CNT2
    IF G-N-HAB > ZEROS
        MULTIPLY W-CNT2 BY 100 GIVING W-TEMP
        DIVIDE G-N-HAB INTO W-TEMP GIVING W-TEMP
        MOVE W-TEMP TO D-PCT
        DISPLAY "  Porcentaje de ocupacion: " D-PCT "%"
    END-IF
    DISPLAY L-DOBLE
    .

*> ================================================================
*> 1. RESERVAS
*> ================================================================
MENU-RESERVAS.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** GESTION DE RESERVAS ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Nueva reserva"
    DISPLAY "  2. Consultar reserva"
    DISPLAY "  3. Modificar reserva"
    DISPLAY "  4. Cancelar reserva"
    DISPLAY "  5. Listar reservas activas"
    DISPLAY "  6. Buscar reservas de un cliente"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM RES-NUEVA
        WHEN 2 PERFORM RES-CONSULTAR
        WHEN 3 PERFORM RES-MODIFICAR
        WHEN 4 PERFORM RES-CANCELAR
        WHEN 5 PERFORM RES-LISTAR
        WHEN 6 PERFORM RES-BUSCAR-CLI
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

RES-NUEVA.
    MOVE "N" TO W-ERR
    IF G-N-RES >= CFG-MAX-RES
        DISPLAY "  [!] ERROR: Capacidad maxima de reservas alcanzada"
        MOVE "S" TO W-ERR
    END-IF
    IF W-ERR = "N"
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "  NUEVA RESERVA"
        DISPLAY L-DOBLE
        DISPLAY "  Habitaciones disponibles:"
        DISPLAY L-PUNTOS
        PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
            IF H-ESTADO(W-I) = "L"
                MOVE H-PRECIO(W-I) TO D-IMP
                DISPLAY "   Hab " H-NUM(W-I)
                        "  " H-TIPO-NOMBRE(W-I)
                        " | Cap:" H-CAP(W-I)
                        " | " D-IMP " EUR/noche"
                        " | " H-VISTA(W-I)
            END-IF
        END-PERFORM
        DISPLAY L-SIMPLE
        DISPLAY "  Numero de habitacion : " WITH NO ADVANCING
        ACCEPT NR-HAB
        PERFORM BUSCAR-HAB
        IF W-ENC = "N"
            DISPLAY "  [!] Habitacion no encontrada"
            MOVE "S" TO W-ERR
        END-IF
    END-IF
    IF W-ERR = "N"
        MOVE W-IDX-H TO W-I
        IF H-ESTADO(W-I) NOT = "L"
            DISPLAY "  [!] Habitacion no disponible"
            MOVE "S" TO W-ERR
        END-IF
    END-IF
    IF W-ERR = "N"
        DISPLAY "  ID cliente (0 = registrar nuevo ahora): "
                WITH NO ADVANCING
        ACCEPT NR-CLI
        IF NR-CLI = ZEROS
            PERFORM CLI-ALTA-RAPIDA
            IF W-ERR = "N"
                MOVE G-ID-CLI TO NR-CLI
                MOVE G-N-CLI TO W-IDX-C
            END-IF
        ELSE
            MOVE NR-CLI TO W-BUSCAR-C
            PERFORM BUSCAR-CLI
            IF W-ENC = "N"
                DISPLAY "  [!] Cliente no encontrado"
                MOVE "S" TO W-ERR
            END-IF
        END-IF
    END-IF
    IF W-ERR = "N"
        DISPLAY "  Fecha entrada  (AAAA-MM-DD) : " WITH NO ADVANCING
        ACCEPT NR-ENT
        DISPLAY "  Fecha salida   (AAAA-MM-DD) : " WITH NO ADVANCING
        ACCEPT NR-SAL
        DISPLAY "  Numero de noches            : " WITH NO ADVANCING
        ACCEPT NR-NOC
        IF NR-NOC <= ZEROS OR NR-NOC > CFG-MAX-NOCHES
            DISPLAY "  [!] Noches invalidas"
            MOVE "S" TO W-ERR
        END-IF
    END-IF
    IF W-ERR = "N"
        DISPLAY "  Adultos                     : " WITH NO ADVANCING
        ACCEPT NR-ADU
        DISPLAY "  Ninos (3-12 anos)           : " WITH NO ADVANCING
        ACCEPT NR-NIN
        DISPLAY "  Bebes (0-2 anos)            : " WITH NO ADVANCING
        ACCEPT NR-BEB
        IF NR-ADU <= ZEROS
            DISPLAY "  [!] Debe haber al menos 1 adulto"
            MOVE "S" TO W-ERR
        END-IF
    END-IF
    IF W-ERR = "N"
        DISPLAY "  Regimen:"
        DISPLAY "   SA=Solo alojamiento   AD=Aloj+Desayuno"
        DISPLAY "   MP=Media pension      PC=Pension completa"
        DISPLAY "  Regimen (SA/AD/MP/PC)       : " WITH NO ADVANCING
        ACCEPT NR-REG
        MOVE FUNCTION UPPER-CASE(NR-REG) TO NR-REG
        IF NR-REG NOT = "SA" AND NR-REG NOT = "AD" AND
           NR-REG NOT = "MP" AND NR-REG NOT = "PC"
            MOVE "SA" TO NR-REG
            DISPLAY "  Regimen no reconocido, aplicado SA"
        END-IF
        DISPLAY "  Canal (MOSTRADOR/WEB/AGENCIA): " WITH NO ADVANCING
        ACCEPT NR-CAN
        IF NR-CAN = SPACES
            MOVE "MOSTRADOR" TO NR-CAN
        END-IF
        DISPLAY "  Notas/peticiones especiales  : " WITH NO ADVANCING
        ACCEPT NR-NOT

        ADD 1 TO G-N-RES
        ADD 1 TO G-ID-RES
        MOVE G-N-RES TO W-J
        MOVE W-IDX-H TO W-I
        MOVE W-IDX-C TO W-K

        MOVE G-ID-RES             TO R-ID(W-J)
        MOVE NR-HAB               TO R-HAB(W-J)
        MOVE NR-CLI               TO R-CLI-ID(W-J)
        MOVE C-NOMBRE-COMP(W-K)   TO R-NOMBRE-CLI(W-J)
        MOVE NR-ENT               TO R-ENTRADA(W-J)
        MOVE NR-SAL               TO R-SALIDA(W-J)
        MOVE NR-NOC               TO R-NOCHES(W-J)
        MOVE NR-ADU               TO R-ADULTOS(W-J)
        MOVE NR-NIN               TO R-NINOS(W-J)
        MOVE NR-BEB               TO R-BEBES(W-J)
        MOVE NR-REG               TO R-REGIMEN(W-J)
        MOVE NR-CAN               TO R-CANAL(W-J)
        MOVE NR-NOT               TO R-NOTAS(W-J)
        MOVE SES-FECHA            TO R-FECHA-RES(W-J)
        MOVE "P"                  TO R-ESTADO(W-J)
        MOVE "N"                  TO R-PAGADA(W-J)
        MOVE H-PRECIO(W-I)        TO R-PRECIO-HAB(W-J)
        MOVE ZEROS                TO R-IMPORTE-SVC(W-J)

        *> Calculo base habitacion
        MULTIPLY H-PRECIO(W-I) BY NR-NOC
            GIVING R-BASE-HAB(W-J)

        *> Suplemento regimen (por adulto por noche)
        EVALUATE NR-REG
            WHEN "SA" MOVE ZEROS TO W-TEMP
            WHEN "AD" MULTIPLY NR-ADU BY 15.00 GIVING W-TEMP
            WHEN "MP" MULTIPLY NR-ADU BY 38.00 GIVING W-TEMP
            WHEN "PC" MULTIPLY NR-ADU BY 60.00 GIVING W-TEMP
        END-EVALUATE
        MULTIPLY W-TEMP BY NR-NOC GIVING R-SUPL-REGIMEN(W-J)

        *> Suplemento ninos (50% precio adulto regimen)
        EVALUATE NR-REG
            WHEN "AD" MULTIPLY NR-NIN BY 7.50  GIVING W-TEMP
            WHEN "MP" MULTIPLY NR-NIN BY 19.00 GIVING W-TEMP
            WHEN "PC" MULTIPLY NR-NIN BY 30.00 GIVING W-TEMP
            WHEN OTHER MOVE ZEROS TO W-TEMP
        END-EVALUATE
        MULTIPLY W-TEMP BY NR-NOC GIVING R-SUPL-EXTRA(W-J)

        *> Descuento por categoria
        ADD R-BASE-HAB(W-J) R-SUPL-REGIMEN(W-J) R-SUPL-EXTRA(W-J)
            GIVING W-TEMP
        EVALUATE C-CAT(W-K)
            WHEN "G"
                MULTIPLY W-TEMP BY 0.12 GIVING R-DESCUENTO(W-J)
            WHEN "P"
                MULTIPLY W-TEMP BY 0.07 GIVING R-DESCUENTO(W-J)
            WHEN OTHER
                MOVE ZEROS TO R-DESCUENTO(W-J)
        END-EVALUATE

        *> Base imponible y total
        ADD R-BASE-HAB(W-J) R-SUPL-REGIMEN(W-J) R-SUPL-EXTRA(W-J)
            GIVING W-TEMP
        SUBTRACT R-DESCUENTO(W-J) FROM W-TEMP GIVING R-BASE-IMPONIBLE(W-J)
        MULTIPLY R-BASE-IMPONIBLE(W-J) BY CFG-IVA
            GIVING R-IVA(W-J)
        ADD R-BASE-IMPONIBLE(W-J) R-IVA(W-J) GIVING R-TOTAL(W-J)
        MOVE ZEROS        TO R-PAGADO(W-J)
        MOVE R-TOTAL(W-J) TO R-PENDIENTE(W-J)

        *> Actualizar habitacion
        MOVE "O"        TO H-ESTADO(W-I)
        MOVE G-ID-RES   TO H-RES-ID(W-I)

        PERFORM MOSTRAR-CONFIRMACION-RESERVA
        ADD 1 TO SES-OPS
    END-IF
    .

MOSTRAR-CONFIRMACION-RESERVA.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  *** RESERVA CONFIRMADA ***"
    DISPLAY L-DOBLE
    MOVE R-ID(W-J) TO D-CNT
    DISPLAY "  ID Reserva     : " D-CNT
    DISPLAY "  Cliente        : " R-NOMBRE-CLI(W-J)
    MOVE W-IDX-H TO W-I
    DISPLAY "  Habitacion     : " R-HAB(W-J)
                " -- " H-TIPO-NOMBRE(W-I)
    DISPLAY "  Entrada        : " R-ENTRADA(W-J)
    DISPLAY "  Salida         : " R-SALIDA(W-J)
    MOVE R-NOCHES(W-J) TO D-NOC
    DISPLAY "  Noches         : " D-NOC
    DISPLAY "  Adultos/Ninos  : " R-ADULTOS(W-J) " / " R-NINOS(W-J)
    DISPLAY "  Regimen        : " R-REGIMEN(W-J)
    DISPLAY "  Canal          : " R-CANAL(W-J)
    DISPLAY L-SIMPLE
    MOVE R-BASE-HAB(W-J) TO D-IMP2
    DISPLAY "  Alojamiento    : " D-IMP2 " EUR"
    IF R-SUPL-REGIMEN(W-J) > ZEROS
        MOVE R-SUPL-REGIMEN(W-J) TO D-IMP2
        DISPLAY "  Supl. regimen  : " D-IMP2 " EUR"
    END-IF
    IF R-SUPL-EXTRA(W-J) > ZEROS
        MOVE R-SUPL-EXTRA(W-J) TO D-IMP2
        DISPLAY "  Supl. ninos    : " D-IMP2 " EUR"
    END-IF
    IF R-DESCUENTO(W-J) > ZEROS
        MOVE R-DESCUENTO(W-J) TO D-IMP2
        DISPLAY "  Dto. cliente   : -" D-IMP2 " EUR"
    END-IF
    MOVE R-IVA(W-J) TO D-IMP2
    DISPLAY "  IVA (10%)      : " D-IMP2 " EUR"
    MOVE R-TOTAL(W-J) TO D-IMP2
    DISPLAY "  ====================================="
    DISPLAY "  TOTAL ESTIMADO : " D-IMP2 " EUR"
    DISPLAY "  ====================================="
    IF R-NOTAS(W-J) NOT = SPACES
        DISPLAY "  Notas          : " R-NOTAS(W-J)
    END-IF
    DISPLAY L-DOBLE
    .

RES-CONSULTAR.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        PERFORM MOSTRAR-RESERVA-COMPLETA
    END-IF
    .

MOSTRAR-RESERVA-COMPLETA.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  DETALLE COMPLETO DE RESERVA"
    DISPLAY L-DOBLE
    DISPLAY "  ID Reserva     : " R-ID(W-J)
    DISPLAY "  Cliente        : " R-NOMBRE-CLI(W-J)
    DISPLAY "  Habitacion     : " R-HAB(W-J)
    DISPLAY "  Entrada        : " R-ENTRADA(W-J)
    DISPLAY "  Salida         : " R-SALIDA(W-J)
    MOVE R-NOCHES(W-J) TO D-NOC
    DISPLAY "  Noches         : " D-NOC
    DISPLAY "  Adultos        : " R-ADULTOS(W-J)
    DISPLAY "  Ninos          : " R-NINOS(W-J)
    DISPLAY "  Bebes          : " R-BEBES(W-J)
    DISPLAY "  Regimen        : " R-REGIMEN(W-J)
    DISPLAY "  Canal reserva  : " R-CANAL(W-J)
    DISPLAY L-SIMPLE
    MOVE R-PRECIO-HAB(W-J)   TO D-IMP
    DISPLAY "  Precio/noche   : " D-IMP " EUR"
    MOVE R-BASE-HAB(W-J)     TO D-IMP2
    DISPLAY "  Base aloj.     : " D-IMP2 " EUR"
    IF R-SUPL-REGIMEN(W-J) > ZEROS
        MOVE R-SUPL-REGIMEN(W-J) TO D-IMP2
        DISPLAY "  Supl. regimen  : " D-IMP2 " EUR"
    END-IF
    IF R-SUPL-EXTRA(W-J) > ZEROS
        MOVE R-SUPL-EXTRA(W-J) TO D-IMP2
        DISPLAY "  Supl. ninos    : " D-IMP2 " EUR"
    END-IF
    IF R-DESCUENTO(W-J) > ZEROS
        MOVE R-DESCUENTO(W-J) TO D-IMP2
        DISPLAY "  Descuento      : -" D-IMP2 " EUR"
    END-IF
    MOVE R-IMPORTE-SVC(W-J)  TO D-IMP2
    DISPLAY "  Servicios      : " D-IMP2 " EUR"
    MOVE R-BASE-IMPONIBLE(W-J) TO D-IMP2
    DISPLAY "  Base imponible : " D-IMP2 " EUR"
    MOVE R-IVA(W-J)          TO D-IMP2
    DISPLAY "  IVA (10%)      : " D-IMP2 " EUR"
    MOVE R-TOTAL(W-J)        TO D-IMP2
    DISPLAY "  TOTAL          : " D-IMP2 " EUR"
    MOVE R-PAGADO(W-J)       TO D-IMP2
    DISPLAY "  Pagado         : " D-IMP2 " EUR"
    MOVE R-PENDIENTE(W-J)    TO D-IMP2
    DISPLAY "  Pendiente      : " D-IMP2 " EUR"
    DISPLAY L-SIMPLE
    EVALUATE R-ESTADO(W-J)
        WHEN "P" DISPLAY "  Estado         : PENDIENTE (antes de llegada)"
        WHEN "A" DISPLAY "  Estado         : ACTIVA (huesped presente)"
        WHEN "C" DISPLAY "  Estado         : COMPLETADA (checkout)"
        WHEN "X" DISPLAY "  Estado         : CANCELADA"
    END-EVALUATE
    EVALUATE R-PAGADA(W-J)
        WHEN "S" DISPLAY "  Pago           : PAGADA"
        WHEN "N" DISPLAY "  Pago           : PENDIENTE"
        WHEN "P" DISPLAY "  Pago           : PAGO PARCIAL"
    END-EVALUATE
    DISPLAY "  F. reserva     : " R-FECHA-RES(W-J)
    IF R-FORMA-PAGO(W-J) NOT = SPACES
        DISPLAY "  Forma pago     : " R-FORMA-PAGO(W-J)
    END-IF
    IF R-NOTAS(W-J) NOT = SPACES
        DISPLAY "  Notas          : " R-NOTAS(W-J)
    END-IF
    DISPLAY L-DOBLE
    .

RES-MODIFICAR.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-ESTADO(W-J) = "C" OR R-ESTADO(W-J) = "X"
            DISPLAY "  [!] No se puede modificar: estado " R-ESTADO(W-J)
        ELSE
            DISPLAY "  Reserva de: " R-NOMBRE-CLI(W-J)
            DISPLAY "  Hab " R-HAB(W-J)
                    " | Entrada: " R-ENTRADA(W-J)
                    " | Salida: " R-SALIDA(W-J)
            DISPLAY L-SIMPLE
            DISPLAY "  Nueva entrada (Enter=mantener): " WITH NO ADVANCING
            ACCEPT W-TXT
            IF W-TXT NOT = SPACES
                MOVE W-TXT TO R-ENTRADA(W-J)
            END-IF
            DISPLAY "  Nueva salida  (Enter=mantener): " WITH NO ADVANCING
            ACCEPT W-TXT
            IF W-TXT NOT = SPACES
                MOVE W-TXT TO R-SALIDA(W-J)
            END-IF
            DISPLAY "  Nuevas noches (0=mantener)    : " WITH NO ADVANCING
            ACCEPT W-NUM
            IF W-NUM > ZEROS
                MOVE W-NUM TO R-NOCHES(W-J)
                MULTIPLY R-PRECIO-HAB(W-J) BY W-NUM
                    GIVING R-BASE-HAB(W-J)
                *> Recalcular suplemento regimen
                EVALUATE R-REGIMEN(W-J)
                    WHEN "SA" MOVE ZEROS TO W-TEMP
                    WHEN "AD"
                        MULTIPLY R-ADULTOS(W-J) BY 15.00 GIVING W-TEMP
                    WHEN "MP"
                        MULTIPLY R-ADULTOS(W-J) BY 38.00 GIVING W-TEMP
                    WHEN "PC"
                        MULTIPLY R-ADULTOS(W-J) BY 60.00 GIVING W-TEMP
                END-EVALUATE
                MULTIPLY W-TEMP BY W-NUM GIVING R-SUPL-REGIMEN(W-J)
                ADD R-BASE-HAB(W-J) R-SUPL-REGIMEN(W-J)
                    R-SUPL-EXTRA(W-J) GIVING W-TEMP
                SUBTRACT R-DESCUENTO(W-J) FROM W-TEMP
                    GIVING R-BASE-IMPONIBLE(W-J)
                MULTIPLY R-BASE-IMPONIBLE(W-J) BY CFG-IVA
                    GIVING R-IVA(W-J)
                ADD R-BASE-IMPONIBLE(W-J) R-IVA(W-J)
                    GIVING R-TOTAL(W-J)
                MOVE R-TOTAL(W-J) TO R-PENDIENTE(W-J)
            END-IF
            DISPLAY "  Notas (Enter=mantener)        : " WITH NO ADVANCING
            ACCEPT W-TXT
            IF W-TXT NOT = SPACES
                MOVE W-TXT TO R-NOTAS(W-J)
            END-IF
            DISPLAY "  *** RESERVA MODIFICADA ***"
            ADD 1 TO SES-OPS
        END-IF
    END-IF
    .

RES-CANCELAR.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-ESTADO(W-J) = "X"
            DISPLAY "  [!] Ya cancelada"
        ELSE
            DISPLAY "  Cliente  : " R-NOMBRE-CLI(W-J)
            DISPLAY "  Hab      : " R-HAB(W-J)
            MOVE R-TOTAL(W-J) TO D-IMP2
            DISPLAY "  Total    : " D-IMP2 " EUR"
            IF R-PAGADO(W-J) > ZEROS
                MOVE R-PAGADO(W-J) TO D-IMP2
                DISPLAY "  Pagado   : " D-IMP2 " EUR (se devolvera)"
            END-IF
            DISPLAY "  Confirmar cancelacion? (S/N): "
                    WITH NO ADVANCING
            ACCEPT W-RESP
            MOVE FUNCTION UPPER-CASE(W-RESP) TO W-RESP
            IF W-RESP = "S"
                MOVE "X" TO R-ESTADO(W-J)
                PERFORM LIBERAR-HAB-RES
                DISPLAY "  *** RESERVA " R-ID(W-J) " CANCELADA ***"
                ADD 1 TO SES-OPS
            ELSE
                DISPLAY "  Operacion cancelada."
            END-IF
        END-IF
    END-IF
    .

LIBERAR-HAB-RES.
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-NUM(W-I) = R-HAB(W-J)
            MOVE "L" TO H-ESTADO(W-I)
            MOVE ZEROS TO H-RES-ID(W-I)
        END-IF
    END-PERFORM
    .

RES-LISTAR.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  RESERVAS ACTIVAS Y PENDIENTES"
    DISPLAY L-DOBLE
    DISPLAY "  ID    HAB  CLIENTE                   ENT.       SAL.       NOCHES TOTAL EUR"
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT W-ACUM
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) = "P" OR R-ESTADO(W-J) = "A"
            ADD 1 TO W-CNT
            ADD R-TOTAL(W-J) TO W-ACUM
            MOVE R-NOCHES(W-J) TO D-NOC
            MOVE R-TOTAL(W-J) TO D-IMP2
            DISPLAY "  " R-ID(W-J)
                    " " R-HAB(W-J)
                    " " R-NOMBRE-CLI(W-J)(1:22)
                    " " R-ENTRADA(W-J)
                    " " R-SALIDA(W-J)
                    "  " D-NOC "n"
                    " " D-IMP2
            IF R-ESTADO(W-J) = "A"
                DISPLAY "   -> EN HOTEL"
            END-IF
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    MOVE W-CNT TO D-CNT
    MOVE W-ACUM TO D-IMP2
    DISPLAY "  Total: " D-CNT " reservas  |  Acum: " D-IMP2 " EUR"
    DISPLAY L-DOBLE
    .

RES-BUSCAR-CLI.
    DISPLAY " "
    DISPLAY "  ID del cliente: " WITH NO ADVANCING
    ACCEPT W-NUM
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-CLI-ID(W-J) = W-NUM
            ADD 1 TO W-CNT
            MOVE R-TOTAL(W-J) TO D-IMP2
            MOVE R-NOCHES(W-J) TO D-NOC
            DISPLAY "  Res " R-ID(W-J)
                    " | Hab " R-HAB(W-J)
                    " | " R-ENTRADA(W-J) " -> " R-SALIDA(W-J)
                    " | " D-NOC "n | " D-IMP2 " EUR"
            EVALUATE R-ESTADO(W-J)
                WHEN "P" DISPLAY "   PENDIENTE"
                WHEN "A" DISPLAY "   ACTIVA"
                WHEN "C" DISPLAY "   COMPLETADA"
                WHEN "X" DISPLAY "   CANCELADA"
            END-EVALUATE
        END-IF
    END-PERFORM
    IF W-CNT = ZEROS
        DISPLAY "  Sin reservas para ese cliente."
    ELSE
        MOVE W-CNT TO D-CNT
        DISPLAY "  Total encontradas: " D-CNT
    END-IF
    .

*> ================================================================
*> 2. CHECK-IN / CHECK-OUT
*> ================================================================
MENU-CHECKIN.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** CHECK-IN / CHECK-OUT ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Check-In (llegada del huesped)"
    DISPLAY "  2. Check-Out (salida del huesped)"
    DISPLAY "  3. Huespedes en el hotel ahora"
    DISPLAY "  4. Llegadas previstas hoy"
    DISPLAY "  5. Salidas previstas hoy"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM HACER-CHECKIN
        WHEN 2 PERFORM HACER-CHECKOUT
        WHEN 3 PERFORM VER-HUESPEDES
        WHEN 4 PERFORM LLEGADAS-HOY
        WHEN 5 PERFORM SALIDAS-HOY
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

HACER-CHECKIN.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CHECK-IN"
    DISPLAY L-DOBLE
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-ESTADO(W-J) NOT = "P"
            DISPLAY "  [!] Estado no permite check-in: " R-ESTADO(W-J)
        ELSE
            MOVE "A" TO R-ESTADO(W-J)
            PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
                IF H-NUM(W-I) = R-HAB(W-J)
                    MOVE "O" TO H-ESTADO(W-I)
                END-IF
            END-PERFORM
            *> Sumar estancias al cliente
            PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
                IF C-ID(W-K) = R-CLI-ID(W-J)
                    ADD 1 TO C-ESTANCIAS(W-K)
                    ADD R-NOCHES(W-J) TO C-NOCHES-TOTAL(W-K)
                END-IF
            END-PERFORM
            DISPLAY " "
            DISPLAY L-DOBLE
            DISPLAY "  *** CHECK-IN COMPLETADO ***"
            DISPLAY L-DOBLE
            DISPLAY "  Bienvenido/a: " R-NOMBRE-CLI(W-J)
            DISPLAY "  Habitacion  : " R-HAB(W-J)
            DISPLAY "  Salida prev.: " R-SALIDA(W-J)
            MOVE R-NOCHES(W-J) TO D-NOC
            DISPLAY "  Noches      : " D-NOC
            DISPLAY "  Regimen     : " R-REGIMEN(W-J)
            IF R-NOTAS(W-J) NOT = SPACES
                DISPLAY "  Nota VIP    : " R-NOTAS(W-J)
            END-IF
            DISPLAY L-SIMPLE
            DISPLAY "  Llave entregada. Que disfrute su estancia!"
            ADD 1 TO SES-OPS
        END-IF
    END-IF
    .

HACER-CHECKOUT.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CHECK-OUT"
    DISPLAY L-DOBLE
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-ESTADO(W-J) NOT = "A"
            DISPLAY "  [!] El huesped no esta registrado"
        ELSE
            *> Recalcular total final con servicios
            ADD R-BASE-HAB(W-J) R-SUPL-REGIMEN(W-J)
                R-SUPL-EXTRA(W-J) R-IMPORTE-SVC(W-J)
                GIVING W-TEMP
            SUBTRACT R-DESCUENTO(W-J) FROM W-TEMP
                GIVING R-BASE-IMPONIBLE(W-J)
            MULTIPLY R-BASE-IMPONIBLE(W-J) BY CFG-IVA
                GIVING R-IVA(W-J)
            ADD R-BASE-IMPONIBLE(W-J) R-IVA(W-J)
                GIVING R-TOTAL(W-J)
            SUBTRACT R-PAGADO(W-J) FROM R-TOTAL(W-J)
                GIVING R-PENDIENTE(W-J)

            DISPLAY " "
            DISPLAY L-DOBLE
            DISPLAY "  FACTURA FINAL -- HOTEL COBOL PALACE"
            DISPLAY L-DOBLE
            DISPLAY "  Cliente        : " R-NOMBRE-CLI(W-J)
            DISPLAY "  Habitacion     : " R-HAB(W-J)
            DISPLAY "  Entrada        : " R-ENTRADA(W-J)
            DISPLAY "  Salida         : " R-SALIDA(W-J)
            MOVE R-NOCHES(W-J) TO D-NOC
            DISPLAY "  Noches         : " D-NOC
            DISPLAY "  Regimen        : " R-REGIMEN(W-J)
            DISPLAY L-SIMPLE
            MOVE R-BASE-HAB(W-J) TO D-IMP2
            DISPLAY "  Alojamiento    : " D-IMP2 " EUR"
            IF R-SUPL-REGIMEN(W-J) > ZEROS
                MOVE R-SUPL-REGIMEN(W-J) TO D-IMP2
                DISPLAY "  Supl. regimen  : " D-IMP2 " EUR"
            END-IF
            IF R-SUPL-EXTRA(W-J) > ZEROS
                MOVE R-SUPL-EXTRA(W-J) TO D-IMP2
                DISPLAY "  Supl. ninos    : " D-IMP2 " EUR"
            END-IF
            IF R-IMPORTE-SVC(W-J) > ZEROS
                MOVE R-IMPORTE-SVC(W-J) TO D-IMP2
                DISPLAY "  Servicios extra: " D-IMP2 " EUR"
            END-IF
            IF R-DESCUENTO(W-J) > ZEROS
                MOVE R-DESCUENTO(W-J) TO D-IMP2
                DISPLAY "  Dto. cliente   : -" D-IMP2 " EUR"
            END-IF
            DISPLAY L-SIMPLE
            MOVE R-BASE-IMPONIBLE(W-J) TO D-IMP2
            DISPLAY "  Base imponible : " D-IMP2 " EUR"
            MOVE R-IVA(W-J) TO D-IMP2
            DISPLAY "  IVA (10%)      : " D-IMP2 " EUR"
            MOVE R-TOTAL(W-J) TO D-IMP2
            DISPLAY "  =================================="
            DISPLAY "  TOTAL FACTURA  : " D-IMP2 " EUR"
            DISPLAY "  =================================="
            IF R-PAGADO(W-J) > ZEROS
                MOVE R-PAGADO(W-J) TO D-IMP2
                DISPLAY "  Ya pagado      : " D-IMP2 " EUR"
            END-IF
            MOVE R-PENDIENTE(W-J) TO D-IMP2
            DISPLAY "  A COBRAR AHORA : " D-IMP2 " EUR"
            DISPLAY L-SIMPLE
            DISPLAY "  Forma de pago (EF/TC/TR/DB): "
                    WITH NO ADVANCING
            ACCEPT W-TXT
            MOVE FUNCTION UPPER-CASE(W-TXT) TO W-TXT
            DISPLAY "  Confirmar checkout y cobro? (S/N): "
                    WITH NO ADVANCING
            ACCEPT W-RESP
            MOVE FUNCTION UPPER-CASE(W-RESP) TO W-RESP
            IF W-RESP = "S"
                MOVE "C" TO R-ESTADO(W-J)
                MOVE "S" TO R-PAGADA(W-J)
                MOVE R-TOTAL(W-J) TO R-PAGADO(W-J)
                MOVE ZEROS TO R-PENDIENTE(W-J)
                MOVE W-TXT TO R-FORMA-PAGO(W-J)
                PERFORM LIBERAR-HAB-RES
                PERFORM ACTUALIZAR-CLIENTE-CHECKOUT
                DISPLAY "  *** CHECK-OUT COMPLETADO ***"
                DISPLAY "  Gracias por su visita. Hasta pronto!"
                ADD 1 TO SES-OPS
            END-IF
        END-IF
    END-IF
    .

ACTUALIZAR-CLIENTE-CHECKOUT.
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-ID(W-K) = R-CLI-ID(W-J)
            ADD R-TOTAL(W-J) TO C-GASTO(W-K)
            *> 1 punto por cada 10 EUR
            DIVIDE 10 INTO R-TOTAL(W-J) GIVING W-TEMP
            ADD W-TEMP TO C-PUNTOS(W-K)
            *> Actualizar categoria
            EVALUATE TRUE
                WHEN C-GASTO(W-K) >= 8000
                    MOVE "G" TO C-CAT(W-K)
                WHEN C-GASTO(W-K) >= 2000
                    MOVE "P" TO C-CAT(W-K)
                WHEN OTHER
                    MOVE "N" TO C-CAT(W-K)
            END-EVALUATE
        END-IF
    END-PERFORM
    .

VER-HUESPEDES.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  HUESPEDES EN EL HOTEL"
    DISPLAY L-DOBLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) = "A"
            ADD 1 TO W-CNT
            MOVE R-NOCHES(W-J) TO D-NOC
            DISPLAY "  Hab " R-HAB(W-J)
                    " | " R-NOMBRE-CLI(W-J)(1:28)
            DISPLAY "    Entrada: " R-ENTRADA(W-J)
                    " Salida: " R-SALIDA(W-J)
                    " | " R-REGIMEN(W-J)
                    " | " D-NOC " noches"
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    MOVE W-CNT TO D-CNT
    DISPLAY "  Huespedes presentes: " D-CNT
    DISPLAY L-DOBLE
    .

LLEGADAS-HOY.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  LLEGADAS PREVISTAS -- " SES-FECHA
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ENTRADA(W-J) = SES-FECHA AND R-ESTADO(W-J) = "P"
            ADD 1 TO W-CNT
            DISPLAY "  Res " R-ID(W-J)
                    " Hab " R-HAB(W-J)
                    " | " R-NOMBRE-CLI(W-J)(1:28)
                    " | " R-REGIMEN(W-J)
        END-IF
    END-PERFORM
    IF W-CNT = ZEROS
        DISPLAY "  Sin llegadas previstas hoy."
    ELSE
        MOVE W-CNT TO D-CNT
        DISPLAY "  Total llegadas: " D-CNT
    END-IF
    .

SALIDAS-HOY.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  SALIDAS PREVISTAS -- " SES-FECHA
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-SALIDA(W-J) = SES-FECHA AND R-ESTADO(W-J) = "A"
            ADD 1 TO W-CNT
            MOVE R-PENDIENTE(W-J) TO D-IMP2
            DISPLAY "  Res " R-ID(W-J)
                    " Hab " R-HAB(W-J)
                    " | " R-NOMBRE-CLI(W-J)(1:25)
                    " | Pdte: " D-IMP2 " EUR"
        END-IF
    END-PERFORM
    IF W-CNT = ZEROS
        DISPLAY "  Sin salidas previstas hoy."
    ELSE
        MOVE W-CNT TO D-CNT
        DISPLAY "  Total salidas: " D-CNT
    END-IF
    .

*> ================================================================
*> 4. HABITACIONES
*> ================================================================
MENU-HAB.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** GESTION DE HABITACIONES ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Ficha de habitacion"
    DISPLAY "  2. Cambiar estado"
    DISPLAY "  3. Actualizar precio"
    DISPLAY "  4. Habitaciones libres"
    DISPLAY "  5. Habitaciones por tipo"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM HAB-FICHA
        WHEN 2 PERFORM HAB-ESTADO
        WHEN 3 PERFORM HAB-PRECIO
        WHEN 4 PERFORM HAB-LIBRES
        WHEN 5 PERFORM HAB-POR-TIPO
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

HAB-FICHA.
    DISPLAY " "
    DISPLAY "  Habitacion: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-H
    PERFORM BUSCAR-HAB
    IF W-ENC = "N"
        DISPLAY "  [!] Habitacion no encontrada"
    ELSE
        MOVE W-IDX-H TO W-I
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "  HABITACION " H-NUM(W-I) " -- " H-TIPO-NOMBRE(W-I)
        DISPLAY L-DOBLE
        DISPLAY "  Numero       : " H-NUM(W-I)
        MOVE H-PLANTA(W-I) TO D-CNT2
        DISPLAY "  Planta       : " D-CNT2
        DISPLAY "  Tipo         : " H-TIPO-NOMBRE(W-I)
        MOVE H-PRECIO(W-I) TO D-IMP
        DISPLAY "  Precio/noche : " D-IMP " EUR"
        DISPLAY "  Capacidad    : " H-CAP(W-I) " personas"
        DISPLAY "  Vistas       : " H-VISTA(W-I)
        DISPLAY "  Amenities    : " H-AMENITIES(W-I)
        IF H-FUMADOR(W-I) = "S"
            DISPLAY "  Fumador      : Si"
        ELSE
            DISPLAY "  Fumador      : No"
        END-IF
        IF H-ACCESIBLE(W-I) = "S"
            DISPLAY "  Accesible    : Si (adaptada)"
        END-IF
        DISPLAY "  Descripcion  : " H-DESC(W-I)
        EVALUATE H-ESTADO(W-I)
            WHEN "L" DISPLAY "  Estado       : LIBRE"
            WHEN "O" DISPLAY "  Estado       : OCUPADA (Res:" H-RES-ID(W-I) ")"
            WHEN "M" DISPLAY "  Estado       : MANTENIMIENTO"
        END-EVALUATE
        DISPLAY L-DOBLE
    END-IF
    .

HAB-ESTADO.
    DISPLAY " "
    DISPLAY "  Habitacion: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-H
    PERFORM BUSCAR-HAB
    IF W-ENC = "N"
        DISPLAY "  [!] Habitacion no encontrada"
    ELSE
        MOVE W-IDX-H TO W-I
        IF H-ESTADO(W-I) = "O"
            DISPLAY "  [!] Ocupada con reserva activa. Use Check-Out."
        ELSE
            DISPLAY "  Estado actual: " H-ESTADO(W-I)
            DISPLAY "  Nuevo estado (L=Libre M=Mantenimiento): "
                    WITH NO ADVANCING
            ACCEPT W-TXT
            MOVE FUNCTION UPPER-CASE(W-TXT) TO W-TXT
            IF W-TXT(1:1) = "L" OR W-TXT(1:1) = "M"
                MOVE W-TXT(1:1) TO H-ESTADO(W-I)
                DISPLAY "  *** ESTADO ACTUALIZADO ***"
                ADD 1 TO SES-OPS
            ELSE
                DISPLAY "  [!] Estado invalido"
            END-IF
        END-IF
    END-IF
    .

HAB-PRECIO.
    DISPLAY " "
    DISPLAY "  Habitacion: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-H
    PERFORM BUSCAR-HAB
    IF W-ENC = "N"
        DISPLAY "  [!] Habitacion no encontrada"
    ELSE
        MOVE W-IDX-H TO W-I
        MOVE H-PRECIO(W-I) TO D-IMP
        DISPLAY "  Precio actual: " D-IMP " EUR/noche"
        DISPLAY "  Nuevo precio (EUR): " WITH NO ADVANCING
        ACCEPT W-IMP
        IF W-IMP > ZEROS
            MOVE W-IMP TO H-PRECIO(W-I)
            MOVE W-IMP TO D-IMP
            DISPLAY "  *** Precio actualizado a " D-IMP " EUR ***"
            ADD 1 TO SES-OPS
        ELSE
            DISPLAY "  [!] Precio invalido"
        END-IF
    END-IF
    .

HAB-LIBRES.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  HABITACIONES LIBRES"
    DISPLAY L-DOBLE
    DISPLAY "  HAB  TIPO                 CAP  PRECIO/NOC  VISTA"
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-ESTADO(W-I) = "L"
            ADD 1 TO W-CNT
            MOVE H-PRECIO(W-I) TO D-IMP
            DISPLAY "  " H-NUM(W-I)
                    "  " H-TIPO-NOMBRE(W-I)
                    "  " H-CAP(W-I)
                    "  " D-IMP
                    "  " H-VISTA(W-I)
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    MOVE W-CNT TO D-CNT
    DISPLAY "  Total libres: " D-CNT
    DISPLAY L-DOBLE
    .

HAB-POR-TIPO.
    DISPLAY " "
    DISPLAY "  Tipo (SI/DO/ST/SU/PS): " WITH NO ADVANCING
    ACCEPT W-TXT
    MOVE FUNCTION UPPER-CASE(W-TXT) TO W-TXT
    DISPLAY " "
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-TIPO(W-I) = W-TXT(1:2)
            ADD 1 TO W-CNT
            MOVE H-PRECIO(W-I) TO D-IMP
            DISPLAY "  Hab " H-NUM(W-I)
                    " Planta " H-PLANTA(W-I)
                    " | " D-IMP " EUR"
                    " | Cap " H-CAP(W-I)
            EVALUATE H-ESTADO(W-I)
                WHEN "L" DISPLAY "   [LIBRE]"
                WHEN "O" DISPLAY "   [OCUPADA]"
                WHEN "M" DISPLAY "   [MANTENIMIENTO]"
            END-EVALUATE
        END-IF
    END-PERFORM
    IF W-CNT = ZEROS
        DISPLAY "  Sin habitaciones de ese tipo."
    END-IF
    .

*> ================================================================
*> 5. SERVICIOS
*> ================================================================
MENU-SVC.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** SERVICIOS DE HABITACION ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Registrar cargo/servicio"
    DISPLAY "  2. Servicios de una reserva"
    DISPLAY "  3. Catalogo de servicios"
    DISPLAY "  4. Anular ultimo cargo"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM SVC-REGISTRAR
        WHEN 2 PERFORM SVC-VER
        WHEN 3 PERFORM SVC-CATALOGO
        WHEN 4 PERFORM SVC-ANULAR
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

SVC-REGISTRAR.
    DISPLAY " "
    DISPLAY "  ID de reserva activa: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-ESTADO(W-J) NOT = "A"
            DISPLAY "  [!] Solo reservas activas"
        ELSE
            PERFORM SVC-CATALOGO
            DISPLAY "  Codigo (2 letras, o 'XX' para cargo libre): "
                    WITH NO ADVANCING
            ACCEPT W-TXT
            MOVE FUNCTION UPPER-CASE(W-TXT) TO W-TXT
            MOVE "N" TO W-ENC
            PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > CFG-MAX-CAT
                IF K-COD(W-K) = W-TXT(1:2)
                    MOVE "S" TO W-ENC
                    MOVE K-PRECIO(W-K) TO W-IMP
                    MOVE K-NOMBRE(W-K) TO W-TXT2
                END-IF
            END-PERFORM
            IF W-ENC = "N"
                DISPLAY "  Descripcion del cargo: " WITH NO ADVANCING
                ACCEPT W-TXT2
                DISPLAY "  Precio unitario (EUR): " WITH NO ADVANCING
                ACCEPT W-IMP
            END-IF
            IF W-IMP > ZEROS
                DISPLAY "  Cantidad (Enter=1): " WITH NO ADVANCING
                ACCEPT W-NUM
                IF W-NUM <= ZEROS
                    MOVE 1 TO W-NUM
                END-IF
                ADD 1 TO G-N-SVC
                ADD 1 TO G-ID-SVC
                MOVE G-N-SVC TO W-I
                MOVE G-ID-SVC           TO S-ID(W-I)
                MOVE R-ID(W-J)          TO S-RES-ID(W-I)
                MOVE R-HAB(W-J)         TO S-HAB(W-I)
                MOVE W-TXT(1:2)         TO S-COD(W-I)
                MOVE W-TXT2             TO S-DESC(W-I)
                MOVE W-NUM              TO S-CANT(W-I)
                MOVE W-IMP              TO S-PU(W-I)
                MULTIPLY W-IMP BY W-NUM GIVING S-TOTAL(W-I)
                MOVE SES-FECHA          TO S-FECHA(W-I)
                MOVE SES-HORA           TO S-HORA(W-I)
                ADD S-TOTAL(W-I) TO R-IMPORTE-SVC(W-J)
                MOVE S-TOTAL(W-I) TO D-IMP
                DISPLAY "  *** CARGO REGISTRADO: " D-IMP " EUR ***"
                ADD 1 TO SES-OPS
            ELSE
                DISPLAY "  [!] Importe invalido"
            END-IF
        END-IF
    END-IF
    .

SVC-VER.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "  SERVICIOS -- Reserva " R-ID(W-J)
                " -- " R-NOMBRE-CLI(W-J)(1:25)
        DISPLAY L-DOBLE
        DISPLAY "  FECHA       HORA   DESCRIPCION                CANT   TOTAL"
        DISPLAY L-SIMPLE
        MOVE ZEROS TO W-CNT W-ACUM
        PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
            IF S-RES-ID(W-I) = R-ID(W-J)
                ADD 1 TO W-CNT
                ADD S-TOTAL(W-I) TO W-ACUM
                MOVE S-TOTAL(W-I) TO D-IMP
                DISPLAY "  " S-FECHA(W-I)
                        " " S-HORA(W-I)
                        " " S-DESC(W-I)(1:25)
                        "  " S-CANT(W-I)
                        "  " D-IMP " EUR"
            END-IF
        END-PERFORM
        DISPLAY L-SIMPLE
        IF W-CNT = ZEROS
            DISPLAY "  Sin servicios registrados."
        ELSE
            MOVE W-CNT  TO D-CNT
            MOVE W-ACUM TO D-IMP2
            DISPLAY "  Total cargos   : " D-CNT
            DISPLAY "  TOTAL SERVICIOS: " D-IMP2 " EUR"
        END-IF
        DISPLAY L-DOBLE
    END-IF
    .

SVC-CATALOGO.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CATALOGO DE SERVICIOS Y PRECIOS"
    DISPLAY L-DOBLE
    DISPLAY "  COD  NOMBRE                          PRECIO    UNIDAD"
    DISPLAY L-SIMPLE
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > CFG-MAX-CAT
        IF K-COD(W-K) NOT = SPACES
            MOVE K-PRECIO(W-K) TO D-IMP
            DISPLAY "  " K-COD(W-K)
                    "   " K-NOMBRE(W-K)
                    "  " D-IMP " EUR"
                    " / " K-UNIDAD(W-K)
        END-IF
    END-PERFORM
    DISPLAY L-DOBLE
    .

SVC-ANULAR.
    DISPLAY " "
    IF G-N-SVC = ZEROS
        DISPLAY "  Sin servicios para anular."
    ELSE
        MOVE G-N-SVC TO W-I
        MOVE S-TOTAL(W-I) TO D-IMP
        DISPLAY "  Ultimo cargo:"
        DISPLAY "  Res " S-RES-ID(W-I)
                " | " S-DESC(W-I)
                " | " D-IMP " EUR"
        DISPLAY "  Anular este cargo? (S/N): " WITH NO ADVANCING
        ACCEPT W-RESP
        MOVE FUNCTION UPPER-CASE(W-RESP) TO W-RESP
        IF W-RESP = "S"
            PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
                IF R-ID(W-J) = S-RES-ID(W-I)
                    SUBTRACT S-TOTAL(W-I) FROM R-IMPORTE-SVC(W-J)
                END-IF
            END-PERFORM
            SUBTRACT 1 FROM G-N-SVC
            DISPLAY "  *** CARGO ANULADO ***"
            ADD 1 TO SES-OPS
        ELSE
            DISPLAY "  Operacion cancelada."
        END-IF
    END-IF
    .

*> ================================================================
*> 6. CLIENTES
*> ================================================================
MENU-CLI.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** CLIENTES Y FIDELIZACION ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Nuevo cliente"
    DISPLAY "  2. Ficha de cliente"
    DISPLAY "  3. Editar datos"
    DISPLAY "  4. Buscar cliente"
    DISPLAY "  5. Clientes VIP (Gold y Plus)"
    DISPLAY "  6. Canjear puntos"
    DISPLAY "  7. Ranking fidelizacion"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM CLI-ALTA
        WHEN 2 PERFORM CLI-FICHA
        WHEN 3 PERFORM CLI-EDITAR
        WHEN 4 PERFORM CLI-BUSCAR
        WHEN 5 PERFORM CLI-VIP
        WHEN 6 PERFORM CLI-CANJEAR
        WHEN 7 PERFORM CLI-RANKING
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

CLI-ALTA.
    IF G-N-CLI >= CFG-MAX-CLI
        DISPLAY "  [!] Capacidad maxima de clientes"
    ELSE
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "  REGISTRO DE NUEVO CLIENTE"
        DISPLAY L-DOBLE
        DISPLAY "  Nombre           : " WITH NO ADVANCING
        ACCEPT NC-NOM
        DISPLAY "  Apellidos        : " WITH NO ADVANCING
        ACCEPT NC-APE
        DISPLAY "  N. Documento     : " WITH NO ADVANCING
        ACCEPT NC-DOC
        DISPLAY "  Telefono         : " WITH NO ADVANCING
        ACCEPT NC-TEL
        DISPLAY "  Email            : " WITH NO ADVANCING
        ACCEPT NC-EML
        DISPLAY "  Pais de origen   : " WITH NO ADVANCING
        ACCEPT NC-PAI
        DISPLAY "  Idioma preferido : " WITH NO ADVANCING
        ACCEPT NC-IDI
        DISPLAY "  Observaciones    : " WITH NO ADVANCING
        ACCEPT NC-OBS
        ADD 1 TO G-N-CLI
        ADD 1 TO G-ID-CLI
        MOVE G-N-CLI TO W-K
        MOVE G-ID-CLI         TO C-ID(W-K)
        MOVE NC-NOM           TO C-NOMBRE(W-K)
        MOVE NC-APE           TO C-APELLIDOS(W-K)
        MOVE NC-DOC           TO C-DOC(W-K)
        MOVE NC-TEL           TO C-TEL(W-K)
        MOVE NC-EML           TO C-EMAIL(W-K)
        MOVE NC-PAI           TO C-PAIS(W-K)
        MOVE NC-IDI           TO C-IDIOMA(W-K)
        MOVE NC-OBS           TO C-OBSERVACIONES(W-K)
        MOVE "N"              TO C-CAT(W-K)
        MOVE ZEROS            TO C-PUNTOS(W-K)
        MOVE ZEROS            TO C-ESTANCIAS(W-K)
        MOVE ZEROS            TO C-GASTO(W-K)
        MOVE ZEROS            TO C-NOCHES-TOTAL(W-K)
        MOVE "S"              TO C-ACTIVO(W-K)
        MOVE SES-FECHA        TO C-FECHA-ALTA(W-K)
        *> Nombre completo
        MOVE SPACES TO C-NOMBRE-COMP(W-K)
        MOVE NC-NOM TO C-NOMBRE-COMP(W-K)
        MOVE NC-APE TO W-TXT
        INSPECT W-TXT TALLYING W-NUM FOR LEADING SPACES
        IF W-NUM < 35
            STRING NC-NOM DELIMITED SIZE
                   " "   DELIMITED SIZE
                   NC-APE DELIMITED SIZE
                   INTO C-NOMBRE-COMP(W-K)
        END-IF
        MOVE G-ID-CLI TO D-CNT
        DISPLAY "  *** CLIENTE REGISTRADO -- ID: " D-CNT " ***"
        ADD 1 TO SES-OPS
    END-IF
    .

CLI-ALTA-RAPIDA.
    MOVE "N" TO W-ERR
    IF G-N-CLI >= CFG-MAX-CLI
        DISPLAY "  [!] Sin capacidad para nuevos clientes"
        MOVE "S" TO W-ERR
    END-IF
    IF W-ERR = "N"
        DISPLAY " "
        DISPLAY "  -- Alta rapida de cliente --"
        DISPLAY "  Nombre y apellidos : " WITH NO ADVANCING
        ACCEPT NC-NOM
        DISPLAY "  N. Documento       : " WITH NO ADVANCING
        ACCEPT NC-DOC
        DISPLAY "  Telefono           : " WITH NO ADVANCING
        ACCEPT NC-TEL
        DISPLAY "  Pais               : " WITH NO ADVANCING
        ACCEPT NC-PAI
        MOVE "  " TO NC-APE
        MOVE "  " TO NC-EML
        MOVE "ES" TO NC-IDI
        MOVE "  " TO NC-OBS
        ADD 1 TO G-N-CLI
        ADD 1 TO G-ID-CLI
        MOVE G-N-CLI TO W-IDX-C
        MOVE G-ID-CLI    TO C-ID(W-IDX-C)
        MOVE NC-NOM      TO C-NOMBRE(W-IDX-C)
        MOVE NC-NOM      TO C-NOMBRE-COMP(W-IDX-C)
        MOVE NC-DOC      TO C-DOC(W-IDX-C)
        MOVE NC-TEL      TO C-TEL(W-IDX-C)
        MOVE NC-PAI      TO C-PAIS(W-IDX-C)
        MOVE "N"         TO C-CAT(W-IDX-C)
        MOVE ZEROS       TO C-PUNTOS(W-IDX-C)
        MOVE ZEROS       TO C-ESTANCIAS(W-IDX-C)
        MOVE ZEROS       TO C-GASTO(W-IDX-C)
        MOVE ZEROS       TO C-NOCHES-TOTAL(W-IDX-C)
        MOVE "S"         TO C-ACTIVO(W-IDX-C)
        MOVE SES-FECHA   TO C-FECHA-ALTA(W-IDX-C)
        MOVE G-ID-CLI TO D-CNT
        DISPLAY "  Cliente dado de alta. ID: " D-CNT
    END-IF
    .

CLI-FICHA.
    DISPLAY " "
    DISPLAY "  ID del cliente: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-C
    PERFORM BUSCAR-CLI
    IF W-ENC = "N"
        DISPLAY "  [!] Cliente no encontrado"
    ELSE
        MOVE W-IDX-C TO W-K
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "  FICHA DE CLIENTE -- ID " C-ID(W-K)
        DISPLAY L-DOBLE
        DISPLAY "  Nombre        : " C-NOMBRE(W-K)
        IF C-APELLIDOS(W-K) NOT = SPACES
            DISPLAY "  Apellidos     : " C-APELLIDOS(W-K)
        END-IF
        DISPLAY "  Documento     : " C-DOC(W-K)
        DISPLAY "  Telefono      : " C-TEL(W-K)
        IF C-EMAIL(W-K) NOT = SPACES
            DISPLAY "  Email         : " C-EMAIL(W-K)
        END-IF
        DISPLAY "  Pais          : " C-PAIS(W-K)
        DISPLAY "  Idioma        : " C-IDIOMA(W-K)
        DISPLAY L-SIMPLE
        EVALUATE C-CAT(W-K)
            WHEN "G"
                DISPLAY "  Categoria     : ** GOLD ** (descuento 12%)"
            WHEN "P"
                DISPLAY "  Categoria     : * PLUS * (descuento 7%)"
            WHEN "N"
                DISPLAY "  Categoria     : Normal"
        END-EVALUATE
        DISPLAY "  Puntos        : " C-PUNTOS(W-K)
        DISPLAY "  Estancias     : " C-ESTANCIAS(W-K)
        DISPLAY "  Noches total  : " C-NOCHES-TOTAL(W-K)
        MOVE C-GASTO(W-K) TO D-IMP2
        DISPLAY "  Gasto total   : " D-IMP2 " EUR"
        DISPLAY "  Alta          : " C-FECHA-ALTA(W-K)
        IF C-OBSERVACIONES(W-K) NOT = SPACES
            DISPLAY "  Observaciones : " C-OBSERVACIONES(W-K)
        END-IF
        DISPLAY L-SIMPLE
        *> Reservas del cliente
        MOVE ZEROS TO W-CNT
        PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
            IF R-CLI-ID(W-J) = C-ID(W-K) AND
               R-ESTADO(W-J) NOT = "X"
                ADD 1 TO W-CNT
            END-IF
        END-PERFORM
        MOVE W-CNT TO D-CNT
        DISPLAY "  Reservas activas: " D-CNT
        DISPLAY L-DOBLE
    END-IF
    .

CLI-EDITAR.
    DISPLAY " "
    DISPLAY "  ID del cliente: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-C
    PERFORM BUSCAR-CLI
    IF W-ENC = "N"
        DISPLAY "  [!] Cliente no encontrado"
    ELSE
        MOVE W-IDX-C TO W-K
        DISPLAY "  Editando: " C-NOMBRE-COMP(W-K)
        DISPLAY "  Tel actual: " C-TEL(W-K)
        DISPLAY "  Nuevo tel (Enter=mantener): " WITH NO ADVANCING
        ACCEPT NC-TEL
        IF NC-TEL NOT = SPACES
            MOVE NC-TEL TO C-TEL(W-K)
        END-IF
        DISPLAY "  Email actual: " C-EMAIL(W-K)
        DISPLAY "  Nuevo email (Enter=mantener): " WITH NO ADVANCING
        ACCEPT NC-EML
        IF NC-EML NOT = SPACES
            MOVE NC-EML TO C-EMAIL(W-K)
        END-IF
        DISPLAY "  Observ. actual: " C-OBSERVACIONES(W-K)
        DISPLAY "  Nueva observacion (Enter=mantener): "
                WITH NO ADVANCING
        ACCEPT NC-OBS
        IF NC-OBS NOT = SPACES
            MOVE NC-OBS TO C-OBSERVACIONES(W-K)
        END-IF
        DISPLAY "  *** DATOS ACTUALIZADOS ***"
        ADD 1 TO SES-OPS
    END-IF
    .

CLI-BUSCAR.
    DISPLAY " "
    DISPLAY "  Buscar por (1=Nombre 2=Documento 3=Pais): "
            WITH NO ADVANCING
    ACCEPT W-SUB
    DISPLAY "  Texto a buscar: " WITH NO ADVANCING
    ACCEPT W-TXT
    MOVE FUNCTION UPPER-CASE(W-TXT) TO W-TXT
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-ACTIVO(W-K) = "S"
            MOVE FUNCTION UPPER-CASE(C-NOMBRE-COMP(W-K)) TO W-TXT2
            EVALUATE W-SUB
                WHEN 1
                    IF W-TXT2(1:6) = W-TXT(1:6) OR
                       W-TXT2(1:5) = W-TXT(1:5) OR
                       W-TXT2(1:4) = W-TXT(1:4) OR
                       W-TXT2(1:3) = W-TXT(1:3)
                        ADD 1 TO W-CNT
                        MOVE C-GASTO(W-K) TO D-IMP2
                        DISPLAY "  ID " C-ID(W-K)
                                " " C-NOMBRE-COMP(W-K)(1:28)
                                " " C-PAIS(W-K)(1:12)
                                " Cat:" C-CAT(W-K)
                    END-IF
                WHEN 2
                    IF C-DOC(W-K)(1:8) = W-TXT(1:8)
                        ADD 1 TO W-CNT
                        DISPLAY "  ID " C-ID(W-K)
                                " " C-NOMBRE-COMP(W-K)(1:30)
                                " Doc:" C-DOC(W-K)
                    END-IF
                WHEN 3
                    MOVE FUNCTION UPPER-CASE(C-PAIS(W-K)) TO W-TXT2
                    IF W-TXT2(1:5) = W-TXT(1:5)
                        ADD 1 TO W-CNT
                        DISPLAY "  ID " C-ID(W-K)
                                " " C-NOMBRE-COMP(W-K)(1:30)
                                " " C-PAIS(W-K)
                    END-IF
            END-EVALUATE
        END-IF
    END-PERFORM
    MOVE W-CNT TO D-CNT
    IF W-CNT = ZEROS
        DISPLAY "  Sin resultados."
    ELSE
        DISPLAY "  Encontrados: " D-CNT
    END-IF
    .

CLI-VIP.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CLIENTES VIP (GOLD y PLUS)"
    DISPLAY L-DOBLE
    DISPLAY "  ID     NOMBRE                         CAT    PUNTOS    GASTO EUR"
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF (C-CAT(W-K) = "G" OR C-CAT(W-K) = "P")
           AND C-ACTIVO(W-K) = "S"
            ADD 1 TO W-CNT
            MOVE C-GASTO(W-K) TO D-IMP2
            DISPLAY "  " C-ID(W-K)
                    "  " C-NOMBRE-COMP(W-K)(1:28)
                    "  " C-CAT(W-K)
                    "  " C-PUNTOS(W-K)
                    "  " D-IMP2
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    IF W-CNT = ZEROS
        DISPLAY "  Sin clientes VIP por ahora."
    ELSE
        MOVE W-CNT TO D-CNT
        DISPLAY "  Total VIP: " D-CNT
    END-IF
    DISPLAY L-DOBLE
    .

CLI-CANJEAR.
    DISPLAY " "
    DISPLAY "  ID del cliente: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-C
    PERFORM BUSCAR-CLI
    IF W-ENC = "N"
        DISPLAY "  [!] Cliente no encontrado"
    ELSE
        MOVE W-IDX-C TO W-K
        DISPLAY "  Cliente : " C-NOMBRE-COMP(W-K)
        DISPLAY "  Puntos  : " C-PUNTOS(W-K)
        DIVIDE 10 INTO C-PUNTOS(W-K) GIVING W-TEMP
        MOVE W-TEMP TO D-IMP
        DISPLAY "  Valor   : " D-IMP " EUR"
        IF C-PUNTOS(W-K) < 100
            DISPLAY "  [!] Minimo 100 puntos para canjear (=10 EUR)"
        ELSE
            DISPLAY "  Puntos a canjear (min 100): " WITH NO ADVANCING
            ACCEPT W-NUM
            IF W-NUM < 100 OR W-NUM > C-PUNTOS(W-K)
                DISPLAY "  [!] Puntos invalidos o insuficientes"
            ELSE
                SUBTRACT W-NUM FROM C-PUNTOS(W-K)
                DIVIDE 10 INTO W-NUM GIVING W-TEMP
                MOVE W-TEMP TO D-IMP
                DISPLAY "  *** CANJEADOS " W-NUM " puntos = " D-IMP " EUR ***"
                ADD 1 TO SES-OPS
            END-IF
        END-IF
    END-IF
    .

CLI-RANKING.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  RANKING DE FIDELIZACION"
    DISPLAY L-DOBLE
    DISPLAY "  NOMBRE                         EST  NOCHES  GASTO EUR     CAT"
    DISPLAY L-SIMPLE
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-ACTIVO(W-K) = "S" AND C-ESTANCIAS(W-K) > ZEROS
            ADD 1 TO W-CNT
            MOVE C-GASTO(W-K) TO D-IMP2
            DISPLAY "  " C-NOMBRE-COMP(W-K)(1:28)
                    "  " C-ESTANCIAS(W-K)
                    "  " C-NOCHES-TOTAL(W-K)
                    "  " D-IMP2
                    "  " C-CAT(W-K)
        END-IF
    END-PERFORM
    DISPLAY L-DOBLE
    .

*> ================================================================
*> 7. FACTURACION
*> ================================================================
MENU-FAC.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** FACTURACION Y CAJA ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Emitir factura detallada"
    DISPLAY "  2. Registrar pago parcial"
    DISPLAY "  3. Reservas pendientes de pago"
    DISPLAY "  4. Cierre de caja del dia"
    DISPLAY "  5. Resumen economico general"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM FAC-EMITIR
        WHEN 2 PERFORM FAC-PAGO-PARCIAL
        WHEN 3 PERFORM FAC-PENDIENTES
        WHEN 4 PERFORM FAC-CIERRE
        WHEN 5 PERFORM FAC-RESUMEN
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

FAC-EMITIR.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        DISPLAY " "
        DISPLAY L-DOBLE
        DISPLAY "                   F A C T U R A"
        DISPLAY "            HOTEL COBOL PALACE -- MADRID"
        DISPLAY "              " CFG-STARS
        DISPLAY L-DOBLE
        DISPLAY "  Num. factura : F-" R-ID(W-J)
        DISPLAY "  Fecha emision: " SES-FECHA
        DISPLAY "  Cliente      : " R-NOMBRE-CLI(W-J)
        DISPLAY L-SIMPLE
        DISPLAY "  Hab  " R-HAB(W-J) " | Entrada: " R-ENTRADA(W-J)
                " | Salida: " R-SALIDA(W-J)
        MOVE R-NOCHES(W-J) TO D-NOC
        DISPLAY "  Noches: " D-NOC
                " | Adultos: " R-ADULTOS(W-J)
                " | Ninos: " R-NINOS(W-J)
                " | Regimen: " R-REGIMEN(W-J)
        DISPLAY L-SIMPLE
        DISPLAY "  CONCEPTO                                    IMPORTE"
        DISPLAY L-SIMPLE
        MOVE R-BASE-HAB(W-J) TO D-IMP2
        DISPLAY "  Alojamiento (" R-NOCHES(W-J) " noches x "
        MOVE R-PRECIO-HAB(W-J) TO D-IMP
        DISPLAY   D-IMP " EUR)      " D-IMP2
        IF R-SUPL-REGIMEN(W-J) > ZEROS
            MOVE R-SUPL-REGIMEN(W-J) TO D-IMP2
            DISPLAY "  Suplemento regimen " R-REGIMEN(W-J)
                    "                    " D-IMP2
        END-IF
        IF R-SUPL-EXTRA(W-J) > ZEROS
            MOVE R-SUPL-EXTRA(W-J) TO D-IMP2
            DISPLAY "  Suplemento ninos                           " D-IMP2
        END-IF
        *> Listar servicios
        PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
            IF S-RES-ID(W-I) = R-ID(W-J)
                MOVE S-TOTAL(W-I) TO D-IMP2
                DISPLAY "  " S-DESC(W-I)(1:36) " x" S-CANT(W-I)
                        "  " D-IMP2
            END-IF
        END-PERFORM
        IF R-DESCUENTO(W-J) > ZEROS
            MOVE R-DESCUENTO(W-J) TO D-IMP2
            DISPLAY "  Descuento cliente VIP                    -" D-IMP2
        END-IF
        DISPLAY L-SIMPLE
        MOVE R-BASE-IMPONIBLE(W-J) TO D-IMP2
        DISPLAY "  Base imponible                              " D-IMP2
        MOVE R-IVA(W-J) TO D-IMP2
        DISPLAY "  IVA 10%                                     " D-IMP2
        DISPLAY L-DOBLE
        MOVE R-TOTAL(W-J) TO D-IMP2
        DISPLAY "  TOTAL FACTURA                               " D-IMP2
        DISPLAY L-DOBLE
        EVALUATE R-PAGADA(W-J)
            WHEN "S" DISPLAY "  ESTADO: PAGADA"
            WHEN "N" DISPLAY "  ESTADO: PENDIENTE DE PAGO"
            WHEN "P" DISPLAY "  ESTADO: PAGO PARCIAL"
        END-EVALUATE
        IF R-PAGADO(W-J) > ZEROS
            MOVE R-PAGADO(W-J) TO D-IMP2
            DISPLAY "  Pagado       : " D-IMP2 " EUR"
            MOVE R-PENDIENTE(W-J) TO D-IMP2
            DISPLAY "  Pendiente    : " D-IMP2 " EUR"
        END-IF
        IF R-FORMA-PAGO(W-J) NOT = SPACES
            DISPLAY "  Forma de pago: " R-FORMA-PAGO(W-J)
        END-IF
        DISPLAY L-DOBLE
    END-IF
    .

FAC-PAGO-PARCIAL.
    DISPLAY " "
    DISPLAY "  ID de reserva: " WITH NO ADVANCING
    ACCEPT W-BUSCAR-R
    PERFORM BUSCAR-RES
    IF W-ENC = "N"
        DISPLAY "  [!] Reserva no encontrada"
    ELSE
        MOVE W-IDX-R TO W-J
        IF R-PAGADA(W-J) = "S"
            DISPLAY "  [!] Reserva ya pagada completamente"
        ELSE
            MOVE R-PENDIENTE(W-J) TO D-IMP2
            DISPLAY "  Cliente   : " R-NOMBRE-CLI(W-J)
            DISPLAY "  Total     : " D-IMP2 " EUR pendiente"
            DISPLAY "  Importe a pagar ahora (EUR): " WITH NO ADVANCING
            ACCEPT W-IMP
            IF W-IMP <= ZEROS OR W-IMP > R-PENDIENTE(W-J)
                DISPLAY "  [!] Importe invalido"
            ELSE
                ADD W-IMP TO R-PAGADO(W-J)
                SUBTRACT W-IMP FROM R-PENDIENTE(W-J)
                IF R-PENDIENTE(W-J) <= ZEROS
                    MOVE "S" TO R-PAGADA(W-J)
                    MOVE ZEROS TO R-PENDIENTE(W-J)
                    DISPLAY "  *** FACTURA COMPLETAMENTE PAGADA ***"
                ELSE
                    MOVE "P" TO R-PAGADA(W-J)
                    MOVE R-PENDIENTE(W-J) TO D-IMP2
                    DISPLAY "  *** PAGO PARCIAL REGISTRADO ***"
                    DISPLAY "  Queda pendiente: " D-IMP2 " EUR"
                END-IF
                ADD 1 TO SES-OPS
            END-IF
        END-IF
    END-IF
    .

FAC-PENDIENTES.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  RESERVAS PENDIENTES DE PAGO"
    DISPLAY L-DOBLE
    MOVE ZEROS TO W-CNT W-ACUM
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-PAGADA(W-J) NOT = "S" AND R-ESTADO(W-J) NOT = "X"
            ADD 1 TO W-CNT
            ADD R-PENDIENTE(W-J) TO W-ACUM
            MOVE R-PENDIENTE(W-J) TO D-IMP2
            DISPLAY "  Res " R-ID(W-J)
                    " | " R-NOMBRE-CLI(W-J)(1:25)
                    " | " D-IMP2 " EUR"
            EVALUATE R-PAGADA(W-J)
                WHEN "N" DISPLAY "   (sin pago)"
                WHEN "P" DISPLAY "   (pago parcial)"
            END-EVALUATE
        END-IF
    END-PERFORM
    DISPLAY L-SIMPLE
    IF W-CNT = ZEROS
        DISPLAY "  Todas las reservas estan pagadas."
    ELSE
        MOVE W-CNT TO D-CNT
        MOVE W-ACUM TO D-IMP2
        DISPLAY "  Total pendientes : " D-CNT " reservas"
        DISPLAY "  Importe pendiente: " D-IMP2 " EUR"
    END-IF
    DISPLAY L-DOBLE
    .

FAC-CIERRE.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  CIERRE DE CAJA -- " SES-FECHA
    DISPLAY L-DOBLE
    *> Ingresos del dia (reservas con fecha de reserva = hoy)
    MOVE ZEROS TO W-ACUM W-CNT
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-PAGADA(W-J) = "S" AND R-FECHA-RES(W-J) = SES-FECHA
            ADD R-TOTAL(W-J) TO W-ACUM
            ADD 1 TO W-CNT
        END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    MOVE W-ACUM TO D-IMP2
    DISPLAY "  Reservas cobradas hoy     : " D-CNT
    DISPLAY "  Ingresos del dia          : " D-IMP2 " EUR"
    *> Servicios del dia
    MOVE ZEROS TO W-ACUM2 W-CNT2
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
        IF S-FECHA(W-I) = SES-FECHA
            ADD S-TOTAL(W-I) TO W-ACUM2
            ADD 1 TO W-CNT2
        END-IF
    END-PERFORM
    MOVE W-CNT2  TO D-CNT
    MOVE W-ACUM2 TO D-IMP2
    DISPLAY "  Servicios facturados hoy  : " D-CNT
    DISPLAY "  Importe servicios hoy     : " D-IMP2 " EUR"
    DISPLAY L-SIMPLE
    ADD W-ACUM W-ACUM2 GIVING W-TEMP
    MOVE W-TEMP TO D-IMP2
    DISPLAY "  TOTAL CAJA HOY            : " D-IMP2 " EUR"
    DISPLAY L-SIMPLE
    *> Estado actual
    MOVE ZEROS TO W-CNT W-CNT2
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) = "A" ADD 1 TO W-CNT  END-IF
        IF R-ESTADO(W-J) = "P" ADD 1 TO W-CNT2 END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    DISPLAY "  Huespedes en hotel ahora  : " D-CNT
    MOVE W-CNT2 TO D-CNT
    DISPLAY "  Reservas pendientes       : " D-CNT
    MOVE SES-OPS TO D-CNT
    DISPLAY "  Operaciones en sesion     : " D-CNT
    DISPLAY L-DOBLE
    .

FAC-RESUMEN.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  RESUMEN ECONOMICO GLOBAL"
    DISPLAY L-DOBLE
    MOVE ZEROS TO W-ACUM W-ACUM2 W-TEMP W-TEMP2 W-CNT W-CNT2
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) NOT = "X"
            ADD R-TOTAL(W-J) TO W-ACUM
            ADD 1 TO W-CNT
        END-IF
        IF R-PAGADA(W-J) = "S"
            ADD R-TOTAL(W-J) TO W-ACUM2
            ADD 1 TO W-CNT2
        END-IF
    END-PERFORM
    MOVE ZEROS TO W-TEMP
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
        ADD S-TOTAL(W-I) TO W-TEMP
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    MOVE W-ACUM TO D-IMP2
    DISPLAY "  Reservas facturadas    : " D-CNT
    DISPLAY "  Facturacion total      : " D-IMP2 " EUR"
    MOVE W-CNT2  TO D-CNT
    MOVE W-ACUM2 TO D-IMP2
    DISPLAY "  Reservas cobradas      : " D-CNT
    DISPLAY "  Importe cobrado        : " D-IMP2 " EUR"
    SUBTRACT W-ACUM2 FROM W-ACUM GIVING W-TEMP2
    MOVE W-TEMP2 TO D-IMP2
    DISPLAY "  Pendiente de cobro     : " D-IMP2 " EUR"
    MOVE W-TEMP  TO D-IMP2
    DISPLAY "  Ingresos por servicios : " D-IMP2 " EUR"
    DISPLAY L-DOBLE
    .

*> ================================================================
*> 8. INFORMES
*> ================================================================
MENU-INF.
    DISPLAY " "
    DISPLAY L-SIMPLE
    DISPLAY "  *** INFORMES Y ESTADISTICAS ***"
    DISPLAY L-SIMPLE
    DISPLAY "  1. Informe ejecutivo del hotel"
    DISPLAY "  2. Ocupacion y disponibilidad"
    DISPLAY "  3. Ingresos por tipo de habitacion"
    DISPLAY "  4. Ingresos por regimen"
    DISPLAY "  5. Estadisticas de clientes"
    DISPLAY "  6. Servicios mas solicitados"
    DISPLAY "  7. Reservas por canal"
    DISPLAY "  0. Volver"
    DISPLAY L-SIMPLE
    DISPLAY "  Opcion: " WITH NO ADVANCING
    ACCEPT W-SUB
    EVALUATE W-SUB
        WHEN 1 PERFORM INF-EJECUTIVO
        WHEN 2 PERFORM INF-OCUPACION
        WHEN 3 PERFORM INF-POR-TIPO-HAB
        WHEN 4 PERFORM INF-POR-REGIMEN
        WHEN 5 PERFORM INF-CLIENTES
        WHEN 6 PERFORM INF-SERVICIOS
        WHEN 7 PERFORM INF-CANALES
        WHEN 0 CONTINUE
        WHEN OTHER DISPLAY "  [!] Opcion invalida"
    END-EVALUATE
    .

INF-EJECUTIVO.
    MOVE ZEROS TO W-ACUM W-ACUM2 W-CNT W-CNT2 W-CNT3
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) NOT = "X"
            ADD R-TOTAL(W-J) TO W-ACUM
            ADD 1 TO W-CNT
        END-IF
        IF R-ESTADO(W-J) = "A"
            ADD 1 TO W-CNT2
        END-IF
        IF R-PAGADA(W-J) = "S"
            ADD R-TOTAL(W-J) TO W-ACUM2
        END-IF
    END-PERFORM
    MOVE ZEROS TO W-TEMP
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
        ADD S-TOTAL(W-I) TO W-TEMP
    END-PERFORM
    DISPLAY " "
    DISPLAY L-STARS
    DISPLAY "##                                                            ##"
    DISPLAY "##          INFORME EJECUTIVO -- HOTEL COBOL PALACE          ##"
    DISPLAY "##                   " SES-FECHA "                               ##"
    DISPLAY "##                                                            ##"
    DISPLAY L-STARS
    MOVE G-N-HAB TO D-CNT
    DISPLAY "  Habitaciones total     : " D-CNT
    MOVE ZEROS TO W-CNT3
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-ESTADO(W-I) = "L" ADD 1 TO W-CNT3 END-IF
    END-PERFORM
    MOVE W-CNT3 TO D-CNT
    DISPLAY "  Habitaciones libres    : " D-CNT
    MOVE W-CNT2 TO D-CNT
    DISPLAY "  Huespedes en hotel     : " D-CNT
    IF G-N-HAB > ZEROS
        MULTIPLY W-CNT2 BY 100 GIVING W-TEMP2
        DIVIDE G-N-HAB INTO W-TEMP2 GIVING W-TEMP2
        MOVE W-TEMP2 TO D-PCT
        DISPLAY "  % Ocupacion            : " D-PCT "%"
    END-IF
    DISPLAY L-SIMPLE
    MOVE G-N-RES TO D-CNT
    DISPLAY "  Total reservas         : " D-CNT
    MOVE W-CNT TO D-CNT
    MOVE W-ACUM TO D-IMP2
    DISPLAY "  Reservas activas       : " D-CNT
    DISPLAY "  Facturacion total      : " D-IMP2 " EUR"
    MOVE W-ACUM2 TO D-IMP2
    DISPLAY "  Importe cobrado        : " D-IMP2 " EUR"
    MOVE W-TEMP TO D-IMP2
    DISPLAY "  Ingresos servicios     : " D-IMP2 " EUR"
    DISPLAY L-SIMPLE
    MOVE G-N-CLI TO D-CNT
    DISPLAY "  Clientes registrados   : " D-CNT
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-CAT(W-K) = "G" OR C-CAT(W-K) = "P"
            ADD 1 TO W-CNT
        END-IF
    END-PERFORM
    MOVE W-CNT TO D-CNT
    DISPLAY "  Clientes VIP           : " D-CNT
    MOVE SES-OPS TO D-CNT
    DISPLAY "  Operaciones en sesion  : " D-CNT
    DISPLAY L-STARS
    .

INF-OCUPACION.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  OCUPACION Y DISPONIBILIDAD"
    DISPLAY L-DOBLE
    MOVE ZEROS TO W-CNT W-CNT2 W-CNT3
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-ESTADO(W-I) = "L" ADD 1 TO W-CNT  END-IF
        IF H-ESTADO(W-I) = "O" ADD 1 TO W-CNT2 END-IF
        IF H-ESTADO(W-I) = "M" ADD 1 TO W-CNT3 END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    DISPLAY "  Libres         : " D-CNT
    MOVE W-CNT2 TO D-CNT
    DISPLAY "  Ocupadas       : " D-CNT
    MOVE W-CNT3 TO D-CNT
    DISPLAY "  Mantenimiento  : " D-CNT
    IF G-N-HAB > ZEROS
        MULTIPLY W-CNT2 BY 100 GIVING W-TEMP
        DIVIDE G-N-HAB INTO W-TEMP GIVING W-TEMP
        MOVE W-TEMP TO D-PCT
        DISPLAY "  Ocupacion (%)  : " D-PCT "%"
    END-IF
    DISPLAY L-SIMPLE
    DISPLAY "  POR TIPO:"
    MOVE "SI" TO W-TXT  PERFORM INF-OC-TIPO
    MOVE "DO" TO W-TXT  PERFORM INF-OC-TIPO
    MOVE "ST" TO W-TXT  PERFORM INF-OC-TIPO
    MOVE "SU" TO W-TXT  PERFORM INF-OC-TIPO
    MOVE "PS" TO W-TXT  PERFORM INF-OC-TIPO
    DISPLAY L-DOBLE
    .

INF-OC-TIPO.
    MOVE ZEROS TO W-CNT W-CNT2
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-TIPO(W-I) = W-TXT(1:2)
            ADD 1 TO W-CNT
            IF H-ESTADO(W-I) = "O" ADD 1 TO W-CNT2 END-IF
        END-IF
    END-PERFORM
    IF W-CNT > ZEROS
        EVALUATE W-TXT(1:2)
            WHEN "SI" DISPLAY "   Individual    :"
            WHEN "DO" DISPLAY "   Doble         :"
            WHEN "ST" DISPLAY "   Suite         :"
            WHEN "SU" DISPLAY "   Suite Premium :"
            WHEN "PS" DISPLAY "   Penthouse     :"
        END-EVALUATE
        MOVE W-CNT2 TO D-CNT2
        MOVE W-CNT  TO D-CNT
        DISPLAY "     " D-CNT2 " de " D-CNT " ocupadas"
    END-IF
    .

INF-POR-TIPO-HAB.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  INGRESOS POR TIPO DE HABITACION"
    DISPLAY L-DOBLE
    MOVE "SI" TO W-TXT  PERFORM INF-ING-TIPO
    MOVE "DO" TO W-TXT  PERFORM INF-ING-TIPO
    MOVE "ST" TO W-TXT  PERFORM INF-ING-TIPO
    MOVE "SU" TO W-TXT  PERFORM INF-ING-TIPO
    MOVE "PS" TO W-TXT  PERFORM INF-ING-TIPO
    DISPLAY L-DOBLE
    .

INF-ING-TIPO.
    MOVE ZEROS TO W-CNT W-ACUM
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ESTADO(W-J) NOT = "X"
            PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
                IF H-NUM(W-I) = R-HAB(W-J) AND H-TIPO(W-I) = W-TXT(1:2)
                    ADD 1 TO W-CNT
                    ADD R-TOTAL(W-J) TO W-ACUM
                END-IF
            END-PERFORM
        END-IF
    END-PERFORM
    IF W-CNT > ZEROS
        EVALUATE W-TXT(1:2)
            WHEN "SI" DISPLAY "  Individual      :"
            WHEN "DO" DISPLAY "  Doble           :"
            WHEN "ST" DISPLAY "  Suite           :"
            WHEN "SU" DISPLAY "  Suite Premium   :"
            WHEN "PS" DISPLAY "  Penthouse       :"
        END-EVALUATE
        MOVE W-CNT  TO D-CNT
        MOVE W-ACUM TO D-IMP2
        DISPLAY "    " D-CNT " reservas | " D-IMP2 " EUR"
    END-IF
    .

INF-POR-REGIMEN.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  INGRESOS POR REGIMEN"
    DISPLAY L-DOBLE
    MOVE "SA" TO W-TXT  PERFORM INF-REG-STATS
    MOVE "AD" TO W-TXT  PERFORM INF-REG-STATS
    MOVE "MP" TO W-TXT  PERFORM INF-REG-STATS
    MOVE "PC" TO W-TXT  PERFORM INF-REG-STATS
    DISPLAY L-DOBLE
    .

INF-REG-STATS.
    MOVE ZEROS TO W-CNT W-ACUM
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-REGIMEN(W-J) = W-TXT(1:2) AND R-ESTADO(W-J) NOT = "X"
            ADD 1 TO W-CNT
            ADD R-TOTAL(W-J) TO W-ACUM
        END-IF
    END-PERFORM
    IF W-CNT > ZEROS
        EVALUATE W-TXT(1:2)
            WHEN "SA" DISPLAY "  Solo alojamiento  :"
            WHEN "AD" DISPLAY "  Aloj.+Desayuno    :"
            WHEN "MP" DISPLAY "  Media pension      :"
            WHEN "PC" DISPLAY "  Pension completa   :"
        END-EVALUATE
        MOVE W-CNT  TO D-CNT
        MOVE W-ACUM TO D-IMP2
        DISPLAY "    " D-CNT " reservas | " D-IMP2 " EUR"
    END-IF
    .

INF-CLIENTES.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  ESTADISTICAS DE CLIENTES"
    DISPLAY L-DOBLE
    MOVE ZEROS TO W-CNT W-CNT2 W-CNT3
    MOVE ZEROS TO W-ACUM
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-ACTIVO(W-K) = "S"
            ADD 1 TO W-CNT
            ADD C-GASTO(W-K) TO W-ACUM
            IF C-CAT(W-K) = "G" ADD 1 TO W-CNT2 END-IF
            IF C-CAT(W-K) = "P" ADD 1 TO W-CNT3 END-IF
        END-IF
    END-PERFORM
    MOVE W-CNT  TO D-CNT
    DISPLAY "  Total clientes     : " D-CNT
    MOVE W-CNT2 TO D-CNT
    DISPLAY "  Clientes Gold      : " D-CNT
    MOVE W-CNT3 TO D-CNT
    DISPLAY "  Clientes Plus      : " D-CNT
    MOVE W-ACUM TO D-IMP2
    DISPLAY "  Gasto total global : " D-IMP2 " EUR"
    IF W-CNT > ZEROS
        DIVIDE W-CNT INTO W-ACUM GIVING W-TEMP
        MOVE W-TEMP TO D-IMP2
        DISPLAY "  Gasto medio/cliente: " D-IMP2 " EUR"
    END-IF
    DISPLAY L-SIMPLE
    *> Top 3 paises
    DISPLAY "  PAISES CON MAS CLIENTES:"
    MOVE "Espana" TO W-TXT   PERFORM INF-CLI-PAIS
    MOVE "Francia" TO W-TXT  PERFORM INF-CLI-PAIS
    MOVE "Alemania" TO W-TXT PERFORM INF-CLI-PAIS
    MOVE "Reino Unido" TO W-TXT PERFORM INF-CLI-PAIS
    MOVE "Italia" TO W-TXT   PERFORM INF-CLI-PAIS
    DISPLAY L-DOBLE
    .

INF-CLI-PAIS.
    MOVE ZEROS TO W-CNT
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-PAIS(W-K)(1:10) = W-TXT(1:10) AND C-ACTIVO(W-K) = "S"
            ADD 1 TO W-CNT
        END-IF
    END-PERFORM
    IF W-CNT > ZEROS
        MOVE W-CNT TO D-CNT
        DISPLAY "    " W-TXT(1:15) " : " D-CNT
    END-IF
    .

INF-SERVICIOS.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  SERVICIOS MAS SOLICITADOS"
    DISPLAY L-DOBLE
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > CFG-MAX-CAT
        IF K-COD(W-K) NOT = SPACES
            MOVE ZEROS TO W-CNT
            MOVE ZEROS TO W-ACUM
            PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-SVC
                IF S-COD(W-I) = K-COD(W-K)
                    ADD S-CANT(W-I) TO W-CNT
                    ADD S-TOTAL(W-I) TO W-ACUM
                END-IF
            END-PERFORM
            IF W-CNT > ZEROS
                MOVE W-CNT  TO D-CNT
                MOVE W-ACUM TO D-IMP2
                DISPLAY "  " K-COD(W-K) " " K-NOMBRE(W-K)
                        " -- " D-CNT " uds -- " D-IMP2 " EUR"
            END-IF
        END-IF
    END-PERFORM
    DISPLAY L-DOBLE
    .

INF-CANALES.
    DISPLAY " "
    DISPLAY L-DOBLE
    DISPLAY "  RESERVAS POR CANAL DE VENTA"
    DISPLAY L-DOBLE
    MOVE "MOSTRADOR" TO W-TXT PERFORM INF-CANAL-STATS
    MOVE "WEB"       TO W-TXT PERFORM INF-CANAL-STATS
    MOVE "AGENCIA"   TO W-TXT PERFORM INF-CANAL-STATS
    MOVE "TELEFONO"  TO W-TXT PERFORM INF-CANAL-STATS
    MOVE "APP"       TO W-TXT PERFORM INF-CANAL-STATS
    DISPLAY L-DOBLE
    .

INF-CANAL-STATS.
    MOVE ZEROS TO W-CNT W-ACUM
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-CANAL(W-J)(1:8) = W-TXT(1:8) AND R-ESTADO(W-J) NOT = "X"
            ADD 1 TO W-CNT
            ADD R-TOTAL(W-J) TO W-ACUM
        END-IF
    END-PERFORM
    IF W-CNT > ZEROS
        MOVE W-CNT  TO D-CNT
        MOVE W-ACUM TO D-IMP2
        DISPLAY "  " W-TXT(1:10)
                " : " D-CNT " reservas | " D-IMP2 " EUR"
    END-IF
    .

*> ================================================================
*> RUTINAS DE BUSQUEDA
*> ================================================================
BUSCAR-HAB.
    MOVE "N" TO W-ENC
    MOVE ZEROS TO W-IDX-H
    PERFORM VARYING W-I FROM 1 BY 1 UNTIL W-I > G-N-HAB
        IF H-NUM(W-I) = W-BUSCAR-H
            MOVE "S" TO W-ENC
            MOVE W-I TO W-IDX-H
        END-IF
    END-PERFORM
    .

BUSCAR-RES.
    MOVE "N" TO W-ENC
    MOVE ZEROS TO W-IDX-R
    PERFORM VARYING W-J FROM 1 BY 1 UNTIL W-J > G-N-RES
        IF R-ID(W-J) = W-BUSCAR-R
            MOVE "S" TO W-ENC
            MOVE W-J TO W-IDX-R
        END-IF
    END-PERFORM
    .

BUSCAR-CLI.
    MOVE "N" TO W-ENC
    MOVE ZEROS TO W-IDX-C
    PERFORM VARYING W-K FROM 1 BY 1 UNTIL W-K > G-N-CLI
        IF C-ID(W-K) = W-BUSCAR-C
            MOVE "S" TO W-ENC
            MOVE W-K TO W-IDX-C
        END-IF
    END-PERFORM
    .

*> ================================================================
*> CARGA DE DATOS DEMO
*> ================================================================
CARGAR-DEMO.
    INITIALIZE TBL-HAB TBL-CLI TBL-RES TBL-SVC TBL-CAT

    *> Catalogo
    MOVE "RM" TO K-COD(1)
    MOVE "Room Service (plato)" TO K-NOMBRE(1)
    MOVE 28.00 TO K-PRECIO(1)
    MOVE "plato" TO K-UNIDAD(1)

    MOVE "MM" TO K-COD(2)
    MOVE "Minibar (consumicion)" TO K-NOMBRE(2)
    MOVE 9.00 TO K-PRECIO(2)
    MOVE "unidad" TO K-UNIDAD(2)

    MOVE "SP" TO K-COD(3)
    MOVE "SPA (sesion)" TO K-NOMBRE(3)
    MOVE 50.00 TO K-PRECIO(3)
    MOVE "sesion" TO K-UNIDAD(3)

    MOVE "MS" TO K-COD(4)
    MOVE "Masaje relajante" TO K-NOMBRE(4)
    MOVE 70.00 TO K-PRECIO(4)
    MOVE "sesion" TO K-UNIDAD(4)

    MOVE "GI" TO K-COD(5)
    MOVE "Gimnasio" TO K-NOMBRE(5)
    MOVE 15.00 TO K-PRECIO(5)
    MOVE "dia" TO K-UNIDAD(5)

    MOVE "LA" TO K-COD(6)
    MOVE "Lavanderia" TO K-NOMBRE(6)
    MOVE 7.00 TO K-PRECIO(6)
    MOVE "prenda" TO K-UNIDAD(6)

    MOVE "AP" TO K-COD(7)
    MOVE "Aparcamiento" TO K-NOMBRE(7)
    MOVE 22.00 TO K-PRECIO(7)
    MOVE "dia" TO K-UNIDAD(7)

    MOVE "TR" TO K-COD(8)
    MOVE "Transfer aeropuerto" TO K-NOMBRE(8)
    MOVE 60.00 TO K-PRECIO(8)
    MOVE "trayecto" TO K-UNIDAD(8)

    MOVE "TO" TO K-COD(9)
    MOVE "Tour Madrid (guia)" TO K-NOMBRE(9)
    MOVE 40.00 TO K-PRECIO(9)
    MOVE "persona" TO K-UNIDAD(9)

    MOVE "BK" TO K-COD(10)
    MOVE "Vino / Cava premium" TO K-NOMBRE(10)
    MOVE 45.00 TO K-PRECIO(10)
    MOVE "botella" TO K-UNIDAD(10)

    MOVE "FT" TO K-COD(11)
    MOVE "Flores y decoracion" TO K-NOMBRE(11)
    MOVE 35.00 TO K-PRECIO(11)
    MOVE "arreglo" TO K-UNIDAD(11)

    MOVE "CB" TO K-COD(12)
    MOVE "Cuna de bebe" TO K-NOMBRE(12)
    MOVE 15.00 TO K-PRECIO(12)
    MOVE "noche" TO K-UNIDAD(12)

    MOVE "RS" TO K-COD(13)
    MOVE "Servicio de niñera" TO K-NOMBRE(13)
    MOVE 25.00 TO K-PRECIO(13)
    MOVE "hora" TO K-UNIDAD(13)

    MOVE "PR" TO K-COD(14)
    MOVE "Prensa internacional" TO K-NOMBRE(14)
    MOVE 5.00 TO K-PRECIO(14)
    MOVE "dia" TO K-UNIDAD(14)

    *> Habitaciones - Planta 1
    MOVE 1  TO G-N-HAB
    MOVE 101 TO H-NUM(1)    MOVE 1 TO H-PLANTA(1)
    MOVE "SI" TO H-TIPO(1)  MOVE "Individual Classic" TO H-TIPO-NOMBRE(1)
    MOVE 89.00 TO H-PRECIO(1) MOVE 1 TO H-CAP(1)
    MOVE "L" TO H-ESTADO(1) MOVE "N" TO H-FUMADOR(1)
    MOVE "N" TO H-ACCESIBLE(1)
    MOVE "Patio interior" TO H-VISTA(1)
    MOVE "TV 4K, Wifi, Minibar" TO H-AMENITIES(1)
    MOVE "Individual clasica con escritorio y bano completo" TO H-DESC(1)

    ADD 1 TO G-N-HAB
    MOVE 102 TO H-NUM(2)    MOVE 1 TO H-PLANTA(2)
    MOVE "DO" TO H-TIPO(2)  MOVE "Doble Estandar" TO H-TIPO-NOMBRE(2)
    MOVE 125.00 TO H-PRECIO(2) MOVE 2 TO H-CAP(2)
    MOVE "L" TO H-ESTADO(2) MOVE "N" TO H-FUMADOR(2)
    MOVE "N" TO H-ACCESIBLE(2)
    MOVE "Patio interior" TO H-VISTA(2)
    MOVE "TV 4K, Wifi, Bano completo" TO H-AMENITIES(2)
    MOVE "Doble con cama matrimonial y bano completo" TO H-DESC(2)

    ADD 1 TO G-N-HAB
    MOVE 103 TO H-NUM(3)    MOVE 1 TO H-PLANTA(3)
    MOVE "DO" TO H-TIPO(3)  MOVE "Doble Superior" TO H-TIPO-NOMBRE(3)
    MOVE 155.00 TO H-PRECIO(3) MOVE 2 TO H-CAP(3)
    MOVE "O" TO H-ESTADO(3) MOVE "N" TO H-FUMADOR(3)
    MOVE "N" TO H-ACCESIBLE(3)
    MOVE "Calle Gran Via" TO H-VISTA(3)
    MOVE "TV 4K, Wifi, Minibar, Caja fuerte" TO H-AMENITIES(3)
    MOVE "Doble superior con balcon y vistas Gran Via" TO H-DESC(3)
    MOVE 10001 TO H-RES-ID(3)

    ADD 1 TO G-N-HAB
    MOVE 104 TO H-NUM(4)    MOVE 1 TO H-PLANTA(4)
    MOVE "DO" TO H-TIPO(4)  MOVE "Doble Accesible" TO H-TIPO-NOMBRE(4)
    MOVE 125.00 TO H-PRECIO(4) MOVE 2 TO H-CAP(4)
    MOVE "L" TO H-ESTADO(4) MOVE "N" TO H-FUMADOR(4)
    MOVE "S" TO H-ACCESIBLE(4)
    MOVE "Jardin" TO H-VISTA(4)
    MOVE "TV 4K, Wifi, Bano adaptado" TO H-AMENITIES(4)
    MOVE "Doble adaptada para movilidad reducida" TO H-DESC(4)

    ADD 1 TO G-N-HAB
    MOVE 105 TO H-NUM(5)    MOVE 1 TO H-PLANTA(5)
    MOVE "SI" TO H-TIPO(5)  MOVE "Individual Plus" TO H-TIPO-NOMBRE(5)
    MOVE 99.00 TO H-PRECIO(5) MOVE 1 TO H-CAP(5)
    MOVE "L" TO H-ESTADO(5) MOVE "N" TO H-FUMADOR(5)
    MOVE "N" TO H-ACCESIBLE(5)
    MOVE "Calle lateral" TO H-VISTA(5)
    MOVE "TV 4K, Wifi, Minibar, Escritorio" TO H-AMENITIES(5)
    MOVE "Individual plus con zona de trabajo" TO H-DESC(5)

    *> Planta 2
    ADD 1 TO G-N-HAB
    MOVE 201 TO H-NUM(6)    MOVE 2 TO H-PLANTA(6)
    MOVE "DO" TO H-TIPO(6)  MOVE "Doble Deluxe" TO H-TIPO-NOMBRE(6)
    MOVE 185.00 TO H-PRECIO(6) MOVE 2 TO H-CAP(6)
    MOVE "O" TO H-ESTADO(6) MOVE "N" TO H-FUMADOR(6)
    MOVE "N" TO H-ACCESIBLE(6)
    MOVE "Gran Via panoramica" TO H-VISTA(6)
    MOVE "TV 4K, Wifi, Jacuzzi, Minibar" TO H-AMENITIES(6)
    MOVE "Deluxe con jacuzzi privado y vistas panoramicas" TO H-DESC(6)
    MOVE 10002 TO H-RES-ID(6)

    ADD 1 TO G-N-HAB
    MOVE 202 TO H-NUM(7)    MOVE 2 TO H-PLANTA(7)
    MOVE "DO" TO H-TIPO(7)  MOVE "Doble Deluxe" TO H-TIPO-NOMBRE(7)
    MOVE 185.00 TO H-PRECIO(7) MOVE 2 TO H-CAP(7)
    MOVE "L" TO H-ESTADO(7) MOVE "N" TO H-FUMADOR(7)
    MOVE "N" TO H-ACCESIBLE(7)
    MOVE "Jardin y piscina" TO H-VISTA(7)
    MOVE "TV 4K, Wifi, Jacuzzi, Minibar" TO H-AMENITIES(7)
    MOVE "Deluxe con jacuzzi y vistas al jardin" TO H-DESC(7)

    ADD 1 TO G-N-HAB
    MOVE 203 TO H-NUM(8)    MOVE 2 TO H-PLANTA(8)
    MOVE "DO" TO H-TIPO(8)  MOVE "Familiar" TO H-TIPO-NOMBRE(8)
    MOVE 210.00 TO H-PRECIO(8) MOVE 4 TO H-CAP(8)
    MOVE "L" TO H-ESTADO(8) MOVE "N" TO H-FUMADOR(8)
    MOVE "N" TO H-ACCESIBLE(8)
    MOVE "Jardin" TO H-VISTA(8)
    MOVE "2 TV, Wifi, 2 Banos, Salon" TO H-AMENITIES(8)
    MOVE "Familiar con salon y 2 banos completos" TO H-DESC(8)

    ADD 1 TO G-N-HAB
    MOVE 204 TO H-NUM(9)    MOVE 2 TO H-PLANTA(9)
    MOVE "DO" TO H-TIPO(9)  MOVE "Familiar Premium" TO H-TIPO-NOMBRE(9)
    MOVE 240.00 TO H-PRECIO(9) MOVE 5 TO H-CAP(9)
    MOVE "L" TO H-ESTADO(9) MOVE "N" TO H-FUMADOR(9)
    MOVE "N" TO H-ACCESIBLE(9)
    MOVE "Gran Via" TO H-VISTA(9)
    MOVE "2 TV, Wifi, Cocina, 2 Banos" TO H-AMENITIES(9)
    MOVE "Familiar premium con cocina y terraza" TO H-DESC(9)

    *> Planta 3
    ADD 1 TO G-N-HAB
    MOVE 301 TO H-NUM(10)   MOVE 3 TO H-PLANTA(10)
    MOVE "ST" TO H-TIPO(10) MOVE "Suite Junior" TO H-TIPO-NOMBRE(10)
    MOVE 295.00 TO H-PRECIO(10) MOVE 2 TO H-CAP(10)
    MOVE "L" TO H-ESTADO(10) MOVE "N" TO H-FUMADOR(10)
    MOVE "N" TO H-ACCESIBLE(10)
    MOVE "Madrid skyline" TO H-VISTA(10)
    MOVE "TV 4K, Wifi, Salon, Minibar premium" TO H-AMENITIES(10)
    MOVE "Suite junior con salon separado y vistas skyline" TO H-DESC(10)

    ADD 1 TO G-N-HAB
    MOVE 302 TO H-NUM(11)   MOVE 3 TO H-PLANTA(11)
    MOVE "ST" TO H-TIPO(11) MOVE "Suite" TO H-TIPO-NOMBRE(11)
    MOVE 350.00 TO H-PRECIO(11) MOVE 2 TO H-CAP(11)
    MOVE "O" TO H-ESTADO(11) MOVE "N" TO H-FUMADOR(11)
    MOVE "N" TO H-ACCESIBLE(11)
    MOVE "Palacio Real" TO H-VISTA(11)
    MOVE "TV 4K, Wifi, Salon, Jacuzzi, Butler" TO H-AMENITIES(11)
    MOVE "Suite con salon, jacuzzi y vistas Palacio Real" TO H-DESC(11)
    MOVE 10003 TO H-RES-ID(11)

    ADD 1 TO G-N-HAB
    MOVE 303 TO H-NUM(12)   MOVE 3 TO H-PLANTA(12)
    MOVE "ST" TO H-TIPO(12) MOVE "Suite Gran Via" TO H-TIPO-NOMBRE(12)
    MOVE 380.00 TO H-PRECIO(12) MOVE 3 TO H-CAP(12)
    MOVE "L" TO H-ESTADO(12) MOVE "N" TO H-FUMADOR(12)
    MOVE "N" TO H-ACCESIBLE(12)
    MOVE "Gran Via 180 grados" TO H-VISTA(12)
    MOVE "TV 8K, Wifi 10G, Salon, 2 Banos" TO H-AMENITIES(12)
    MOVE "Suite con comedor, terraza y vistas 180 Gran Via" TO H-DESC(12)

    *> Planta 4
    ADD 1 TO G-N-HAB
    MOVE 401 TO H-NUM(13)   MOVE 4 TO H-PLANTA(13)
    MOVE "SU" TO H-TIPO(13) MOVE "Suite Premium" TO H-TIPO-NOMBRE(13)
    MOVE 480.00 TO H-PRECIO(13) MOVE 3 TO H-CAP(13)
    MOVE "L" TO H-ESTADO(13) MOVE "N" TO H-FUMADOR(13)
    MOVE "N" TO H-ACCESIBLE(13)
    MOVE "Madrid panoramica" TO H-VISTA(13)
    MOVE "TV 8K, Wifi 10G, Salon, Comedor, Butler" TO H-AMENITIES(13)
    MOVE "Suite premium con teraza privada y butler 24h" TO H-DESC(13)

    ADD 1 TO G-N-HAB
    MOVE 402 TO H-NUM(14)   MOVE 4 TO H-PLANTA(14)
    MOVE "SU" TO H-TIPO(14) MOVE "Suite Premium" TO H-TIPO-NOMBRE(14)
    MOVE 480.00 TO H-PRECIO(14) MOVE 3 TO H-CAP(14)
    MOVE "M" TO H-ESTADO(14) MOVE "N" TO H-FUMADOR(14)
    MOVE "N" TO H-ACCESIBLE(14)
    MOVE "Sierra de Guadarrama" TO H-VISTA(14)
    MOVE "TV 8K, Wifi 10G, Salon, Bano marmol" TO H-AMENITIES(14)
    MOVE "Suite premium en renovacion (en mantenimiento)" TO H-DESC(14)

    ADD 1 TO G-N-HAB
    MOVE 403 TO H-NUM(15)   MOVE 4 TO H-PLANTA(15)
    MOVE "SU" TO H-TIPO(15) MOVE "Suite Presidencial" TO H-TIPO-NOMBRE(15)
    MOVE 650.00 TO H-PRECIO(15) MOVE 4 TO H-CAP(15)
    MOVE "L" TO H-ESTADO(15) MOVE "N" TO H-FUMADOR(15)
    MOVE "N" TO H-ACCESIBLE(15)
    MOVE "Vista 360 Madrid" TO H-VISTA(15)
    MOVE "Home cinema, Piscina priv., Chef" TO H-AMENITIES(15)
    MOVE "Suite presidencial con piscina y chef privado" TO H-DESC(15)

    *> Planta 5 - Penthouse
    ADD 1 TO G-N-HAB
    MOVE 501 TO H-NUM(16)   MOVE 5 TO H-PLANTA(16)
    MOVE "PS" TO H-TIPO(16) MOVE "Penthouse Classic" TO H-TIPO-NOMBRE(16)
    MOVE 850.00 TO H-PRECIO(16) MOVE 4 TO H-CAP(16)
    MOVE "L" TO H-ESTADO(16) MOVE "N" TO H-FUMADOR(16)
    MOVE "N" TO H-ACCESIBLE(16)
    MOVE "Madrid 360 grados" TO H-VISTA(16)
    MOVE "Butler 24h, Piscina, Chef privado" TO H-AMENITIES(16)
    MOVE "Penthouse 250m2 con terraza y piscina privada" TO H-DESC(16)

    ADD 1 TO G-N-HAB
    MOVE 502 TO H-NUM(17)   MOVE 5 TO H-PLANTA(17)
    MOVE "PS" TO H-TIPO(17) MOVE "Penthouse VIP" TO H-TIPO-NOMBRE(17)
    MOVE 1200.00 TO H-PRECIO(17) MOVE 6 TO H-CAP(17)
    MOVE "L" TO H-ESTADO(17) MOVE "N" TO H-FUMADOR(17)
    MOVE "N" TO H-ACCESIBLE(17)
    MOVE "Madrid completo" TO H-VISTA(17)
    MOVE "Todo incluido, Rolls Royce, Mayordomo" TO H-AMENITIES(17)
    MOVE "Penthouse VIP 400m2 experiencia total" TO H-DESC(17)

    *> 3 habitaciones mas en plantas 2 y 3
    ADD 1 TO G-N-HAB
    MOVE 205 TO H-NUM(18)   MOVE 2 TO H-PLANTA(18)
    MOVE "DO" TO H-TIPO(18) MOVE "Doble Estandar" TO H-TIPO-NOMBRE(18)
    MOVE 125.00 TO H-PRECIO(18) MOVE 2 TO H-CAP(18)
    MOVE "L" TO H-ESTADO(18) MOVE "N" TO H-FUMADOR(18)
    MOVE "N" TO H-ACCESIBLE(18)
    MOVE "Patio interior" TO H-VISTA(18)
    MOVE "TV 4K, Wifi" TO H-AMENITIES(18)
    MOVE "Doble estandar planta 2" TO H-DESC(18)

    ADD 1 TO G-N-HAB
    MOVE 304 TO H-NUM(19)   MOVE 3 TO H-PLANTA(19)
    MOVE "ST" TO H-TIPO(19) MOVE "Suite Familiar" TO H-TIPO-NOMBRE(19)
    MOVE 420.00 TO H-PRECIO(19) MOVE 4 TO H-CAP(19)
    MOVE "L" TO H-ESTADO(19) MOVE "N" TO H-FUMADOR(19)
    MOVE "N" TO H-ACCESIBLE(19)
    MOVE "Retiro park" TO H-VISTA(19)
    MOVE "2TV, Wifi, 2 Hab, 2 Banos" TO H-AMENITIES(19)
    MOVE "Suite familiar con 2 dormitorios y salon" TO H-DESC(19)

    ADD 1 TO G-N-HAB
    MOVE 106 TO H-NUM(20)   MOVE 1 TO H-PLANTA(20)
    MOVE "DO" TO H-TIPO(20) MOVE "Doble Romantica" TO H-TIPO-NOMBRE(20)
    MOVE 165.00 TO H-PRECIO(20) MOVE 2 TO H-CAP(20)
    MOVE "L" TO H-ESTADO(20) MOVE "N" TO H-FUMADOR(20)
    MOVE "N" TO H-ACCESIBLE(20)
    MOVE "Jardin romantico" TO H-VISTA(20)
    MOVE "TV 4K, Wifi, Bano con banera" TO H-AMENITIES(20)
    MOVE "Doble romantica con banera y vista al jardin" TO H-DESC(20)

    *> Clientes
    MOVE 1     TO G-N-CLI
    MOVE 5001  TO C-ID(1)
    MOVE "Elena"       TO C-NOMBRE(1)
    MOVE "Garcia Ramirez" TO C-APELLIDOS(1)
    MOVE "Elena Garcia Ramirez" TO C-NOMBRE-COMP(1)
    MOVE "12345678A"   TO C-DOC(1)
    MOVE "612111222"   TO C-TEL(1)
    MOVE "e.garcia@email.es" TO C-EMAIL(1)
    MOVE "Espana"      TO C-PAIS(1)
    MOVE "Espanol"     TO C-IDIOMA(1)
    MOVE "G"           TO C-CAT(1)
    MOVE 3200          TO C-PUNTOS(1)
    MOVE 18            TO C-ESTANCIAS(1)
    MOVE 12500.00      TO C-GASTO(1)
    MOVE 45            TO C-NOCHES-TOTAL(1)
    MOVE "S"           TO C-ACTIVO(1)
    MOVE "2020-05-10"  TO C-FECHA-ALTA(1)
    MOVE "Prefiere piso alto. Alergica al latex" TO C-OBSERVACIONES(1)

    ADD 1  TO G-N-CLI
    MOVE 5002  TO C-ID(2)
    MOVE "William"     TO C-NOMBRE(2)
    MOVE "Johnson"     TO C-APELLIDOS(2)
    MOVE "William Johnson" TO C-NOMBRE-COMP(2)
    MOVE "AB123456"    TO C-DOC(2)
    MOVE "+15559887"   TO C-TEL(2)
    MOVE "w.johnson@corp.us" TO C-EMAIL(2)
    MOVE "Estados Unidos" TO C-PAIS(2)
    MOVE "Ingles"      TO C-IDIOMA(2)
    MOVE "P"           TO C-CAT(2)
    MOVE 480           TO C-PUNTOS(2)
    MOVE 4             TO C-ESTANCIAS(2)
    MOVE 3100.00       TO C-GASTO(2)
    MOVE 12            TO C-NOCHES-TOTAL(2)
    MOVE "S"           TO C-ACTIVO(2)
    MOVE "2023-09-01"  TO C-FECHA-ALTA(2)
    MOVE "Solicita periodico en ingles" TO C-OBSERVACIONES(2)

    ADD 1  TO G-N-CLI
    MOVE 5003  TO C-ID(3)
    MOVE "Hans"        TO C-NOMBRE(3)
    MOVE "Mueller"     TO C-APELLIDOS(3)
    MOVE "Hans Mueller"       TO C-NOMBRE-COMP(3)
    MOVE "DE9876543"   TO C-DOC(3)
    MOVE "+493044556"  TO C-TEL(3)
    MOVE "h.mueller@de.com" TO C-EMAIL(3)
    MOVE "Alemania"    TO C-PAIS(3)
    MOVE "Aleman"      TO C-IDIOMA(3)
    MOVE "P"           TO C-CAT(3)
    MOVE 720           TO C-PUNTOS(3)
    MOVE 6             TO C-ESTANCIAS(3)
    MOVE 4800.00       TO C-GASTO(3)
    MOVE 18            TO C-NOCHES-TOTAL(3)
    MOVE "S"           TO C-ACTIVO(3)
    MOVE "2022-03-15"  TO C-FECHA-ALTA(3)
    MOVE "Cena tarde, minibar siempre lleno" TO C-OBSERVACIONES(3)

    ADD 1  TO G-N-CLI
    MOVE 5004  TO C-ID(4)
    MOVE "Yuki"        TO C-NOMBRE(4)
    MOVE "Tanaka"      TO C-APELLIDOS(4)
    MOVE "Yuki Tanaka" TO C-NOMBRE-COMP(4)
    MOVE "JP7654321"   TO C-DOC(4)
    MOVE "+81312345"   TO C-TEL(4)
    MOVE "y.tanaka@jp.co" TO C-EMAIL(4)
    MOVE "Japon"       TO C-PAIS(4)
    MOVE "Japones"     TO C-IDIOMA(4)
    MOVE "N"           TO C-CAT(4)
    MOVE 95            TO C-PUNTOS(4)
    MOVE 1             TO C-ESTANCIAS(4)
    MOVE 650.00        TO C-GASTO(4)
    MOVE 3             TO C-NOCHES-TOTAL(4)
    MOVE "S"           TO C-ACTIVO(4)
    MOVE "2025-11-20"  TO C-FECHA-ALTA(4)
    MOVE "Primera visita a Espana" TO C-OBSERVACIONES(4)

    ADD 1  TO G-N-CLI
    MOVE 5005  TO C-ID(5)
    MOVE "Marie"       TO C-NOMBRE(5)
    MOVE "Dupont"      TO C-APELLIDOS(5)
    MOVE "Marie Dupont"       TO C-NOMBRE-COMP(5)
    MOVE "FR1234567"   TO C-DOC(5)
    MOVE "+33612345"   TO C-TEL(5)
    MOVE "m.dupont@fr.eu" TO C-EMAIL(5)
    MOVE "Francia"     TO C-PAIS(5)
    MOVE "Frances"     TO C-IDIOMA(5)
    MOVE "N"           TO C-CAT(5)
    MOVE 0             TO C-PUNTOS(5)
    MOVE 0             TO C-ESTANCIAS(5)
    MOVE 0             TO C-GASTO(5)
    MOVE 0             TO C-NOCHES-TOTAL(5)
    MOVE "S"           TO C-ACTIVO(5)
    MOVE "2026-03-13"  TO C-FECHA-ALTA(5)
    MOVE "Llega hoy, luna de miel" TO C-OBSERVACIONES(5)

    MOVE 5005 TO G-ID-CLI

    *> Reservas
    MOVE 1     TO G-N-RES
    MOVE 10001 TO R-ID(1)
    MOVE 103   TO R-HAB(1)
    MOVE 5001  TO R-CLI-ID(1)
    MOVE "Elena Garcia Ramirez"          TO R-NOMBRE-CLI(1)
    MOVE "2026-03-13" TO R-ENTRADA(1)
    MOVE "2026-03-17" TO R-SALIDA(1)
    MOVE 4     TO R-NOCHES(1)
    MOVE 2     TO R-ADULTOS(1)
    MOVE 0     TO R-NINOS(1)
    MOVE 0     TO R-BEBES(1)
    MOVE "AD"  TO R-REGIMEN(1)
    MOVE 155.00 TO R-PRECIO-HAB(1)
    MOVE 620.00 TO R-BASE-HAB(1)
    MOVE 120.00 TO R-SUPL-REGIMEN(1)
    MOVE 0      TO R-SUPL-EXTRA(1)
    MOVE 88.80  TO R-DESCUENTO(1)
    MOVE 0      TO R-IMPORTE-SVC(1)
    MOVE 651.20 TO R-BASE-IMPONIBLE(1)
    MOVE 65.12  TO R-IVA(1)
    MOVE 716.32 TO R-TOTAL(1)
    MOVE 0      TO R-PAGADO(1)
    MOVE 716.32 TO R-PENDIENTE(1)
    MOVE "A"   TO R-ESTADO(1)
    MOVE "N"   TO R-PAGADA(1)
    MOVE "MOSTRADOR" TO R-CANAL(1)
    MOVE "Piso alto, vista calle" TO R-NOTAS(1)
    MOVE "2026-02-25" TO R-FECHA-RES(1)

    ADD 1  TO G-N-RES
    MOVE 10002 TO R-ID(2)
    MOVE 201   TO R-HAB(2)
    MOVE 5003  TO R-CLI-ID(2)
    MOVE "Hans Mueller"                  TO R-NOMBRE-CLI(2)
    MOVE "2026-03-11" TO R-ENTRADA(2)
    MOVE "2026-03-15" TO R-SALIDA(2)
    MOVE 4     TO R-NOCHES(2)
    MOVE 2     TO R-ADULTOS(2)
    MOVE 0     TO R-NINOS(2)
    MOVE 0     TO R-BEBES(2)
    MOVE "PC"  TO R-REGIMEN(2)
    MOVE 185.00 TO R-PRECIO-HAB(2)
    MOVE 740.00 TO R-BASE-HAB(2)
    MOVE 480.00 TO R-SUPL-REGIMEN(2)
    MOVE 0      TO R-SUPL-EXTRA(2)
    MOVE 85.40  TO R-DESCUENTO(2)
    MOVE 95.00  TO R-IMPORTE-SVC(2)
    MOVE 1229.60 TO R-BASE-IMPONIBLE(2)
    MOVE 122.96 TO R-IVA(2)
    MOVE 1352.56 TO R-TOTAL(2)
    MOVE 0      TO R-PAGADO(2)
    MOVE 1352.56 TO R-PENDIENTE(2)
    MOVE "A"   TO R-ESTADO(2)
    MOVE "N"   TO R-PAGADA(2)
    MOVE "AGENCIA" TO R-CANAL(2)
    MOVE "Minibar lleno al llegar, periodico aleman" TO R-NOTAS(2)
    MOVE "2026-03-01" TO R-FECHA-RES(2)

    ADD 1  TO G-N-RES
    MOVE 10003 TO R-ID(3)
    MOVE 302   TO R-HAB(3)
    MOVE 5002  TO R-CLI-ID(3)
    MOVE "William Johnson"               TO R-NOMBRE-CLI(3)
    MOVE "2026-03-12" TO R-ENTRADA(3)
    MOVE "2026-03-14" TO R-SALIDA(3)
    MOVE 2     TO R-NOCHES(3)
    MOVE 2     TO R-ADULTOS(3)
    MOVE 0     TO R-NINOS(3)
    MOVE 0     TO R-BEBES(3)
    MOVE "MP"  TO R-REGIMEN(3)
    MOVE 350.00 TO R-PRECIO-HAB(3)
    MOVE 700.00 TO R-BASE-HAB(3)
    MOVE 152.00 TO R-SUPL-REGIMEN(3)
    MOVE 0      TO R-SUPL-EXTRA(3)
    MOVE 59.64  TO R-DESCUENTO(3)
    MOVE 60.00  TO R-IMPORTE-SVC(3)
    MOVE 852.36 TO R-BASE-IMPONIBLE(3)
    MOVE 85.24  TO R-IVA(3)
    MOVE 937.60 TO R-TOTAL(3)
    MOVE 0      TO R-PAGADO(3)
    MOVE 937.60 TO R-PENDIENTE(3)
    MOVE "A"   TO R-ESTADO(3)
    MOVE "N"   TO R-PAGADA(3)
    MOVE "WEB" TO R-CANAL(3)
    MOVE "Transfer aeropuerto a llegada" TO R-NOTAS(3)
    MOVE "2026-03-08" TO R-FECHA-RES(3)

    ADD 1  TO G-N-RES
    MOVE 10004 TO R-ID(4)
    MOVE 303   TO R-HAB(4)
    MOVE 5005  TO R-CLI-ID(4)
    MOVE "Marie Dupont"                  TO R-NOMBRE-CLI(4)
    MOVE "2026-03-13" TO R-ENTRADA(4)
    MOVE "2026-03-18" TO R-SALIDA(4)
    MOVE 5     TO R-NOCHES(4)
    MOVE 2     TO R-ADULTOS(4)
    MOVE 0     TO R-NINOS(4)
    MOVE 0     TO R-BEBES(4)
    MOVE "PC"  TO R-REGIMEN(4)
    MOVE 380.00 TO R-PRECIO-HAB(4)
    MOVE 1900.00 TO R-BASE-HAB(4)
    MOVE 600.00 TO R-SUPL-REGIMEN(4)
    MOVE 0      TO R-SUPL-EXTRA(4)
    MOVE 0      TO R-DESCUENTO(4)
    MOVE 0      TO R-IMPORTE-SVC(4)
    MOVE 2500.00 TO R-BASE-IMPONIBLE(4)
    MOVE 250.00 TO R-IVA(4)
    MOVE 2750.00 TO R-TOTAL(4)
    MOVE 0      TO R-PAGADO(4)
    MOVE 2750.00 TO R-PENDIENTE(4)
    MOVE "P"   TO R-ESTADO(4)
    MOVE "N"   TO R-PAGADA(4)
    MOVE "TELEFONO" TO R-CANAL(4)
    MOVE "Luna de miel, flores y cava al llegar" TO R-NOTAS(4)
    MOVE "2026-03-13" TO R-FECHA-RES(4)

    MOVE 10004 TO G-ID-RES

    *> Servicios demo
    MOVE 1     TO G-N-SVC
    MOVE 20001 TO S-ID(1)
    MOVE 10001 TO S-RES-ID(1)
    MOVE 103   TO S-HAB(1)
    MOVE "RM"  TO S-COD(1)
    MOVE "Room Service - cena romantica" TO S-DESC(1)
    MOVE 2     TO S-CANT(1)
    MOVE 28.00 TO S-PU(1)
    MOVE 56.00 TO S-TOTAL(1)
    MOVE "2026-03-13" TO S-FECHA(1)
    MOVE "21:00" TO S-HORA(1)

    ADD 1  TO G-N-SVC
    MOVE 20002 TO S-ID(2)
    MOVE 10002 TO S-RES-ID(2)
    MOVE 201   TO S-HAB(2)
    MOVE "SP"  TO S-COD(2)
    MOVE "Acceso SPA (2 personas)" TO S-DESC(2)
    MOVE 2     TO S-CANT(2)
    MOVE 50.00 TO S-PU(2)
    MOVE 100.00 TO S-TOTAL(2)
    MOVE "2026-03-12" TO S-FECHA(2)
    MOVE "16:00" TO S-HORA(2)

    ADD 1  TO G-N-SVC
    MOVE 20003 TO S-ID(3)
    MOVE 10003 TO S-RES-ID(3)
    MOVE 302   TO S-HAB(3)
    MOVE "TR"  TO S-COD(3)
    MOVE "Transfer aeropuerto llegada" TO S-DESC(3)
    MOVE 1     TO S-CANT(3)
    MOVE 60.00 TO S-PU(3)
    MOVE 60.00 TO S-TOTAL(3)
    MOVE "2026-03-12" TO S-FECHA(3)
    MOVE "09:00" TO S-HORA(3)

    MOVE 20003 TO G-ID-SVC
    .
