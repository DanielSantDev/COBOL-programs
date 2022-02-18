       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGISTRA-FOR.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQFOR ASSIGN TO DISK
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS WS-FS-ARQFOR.
       DATA DIVISION.
       FILE SECTION.
       FD  ARQFOR.
       01  REG-FOR.
            03  CD-FORN        PIC  9(03).
            03  NM-FORN        PIC  X(20).
            03  NM-CIDADE      PIC  X(20).
       WORKING-STORAGE SECTION.
       01  WS-FS-ARQFOR       PIC X(02).
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           PERFORM FINALIZA.
           STOP RUN.
       ABRE-ARQ.
           OPEN OUTPUT ARQFOR.
           IF WS-FS-ARQFOR NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - REGISTRO FORNEC' WS-FS-ARQFOR
              STOP RUN.
       PROCESSO.
           MOVE 001 TO CD-FORN.
           MOVE "ISM" TO NM-FORN.
           MOVE "SÃO PAULO" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 013 TO CD-FORN.
           MOVE "DECATRON" TO NM-FORN.
           MOVE "RIO DE JANEIRO" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 026 TO CD-FORN.
           MOVE "S&S SYSTEMS" TO NM-FORN.
           MOVE "SANTOS" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 048 TO CD-FORN.
           MOVE "ENTERDATA" TO NM-FORN.
           MOVE "SANTOS" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 191 TO CD-FORN.
           MOVE "DIGITAL" TO NM-FORN.
           MOVE "RIO DE JANEIRO" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 234 TO CD-FORN.
           MOVE "NETDB" TO NM-FORN.
           MOVE "SANTOS" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 420 TO CD-FORN.
           MOVE "CENTERSOFT" TO NM-FORN.
           MOVE "SANTOS" TO NM-CIDADE
           WRITE REG-FOR.

           MOVE 518 TO CD-FORN.
           MOVE "TRTEC" TO NM-FORN.
           MOVE "CAMPINAS" TO NM-CIDADE
           WRITE REG-FOR.
      *
       FINALIZA.
           CLOSE ARQFOR.
