       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATUALIZA-ARQ.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQFOR ASSIGN TO DISK
              ORGANIZATION IS SEQUENTIAL
              ACCESS MODE IS SEQUENTIAL
              FILE STATUS IS WS-FORN.
       DATA DIVISION.
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
       01 WS-DADOS.
            03 WS-CD-FORN      PIC  9(03).
            03 WS-NM-FORN      PIC  X(20).
            03 WS-NM-CIDADE    PIC  X(20).
       01 WS-SG-MOVIM          PIC  X(01).
       01 WS-FORN              PIC  X(02) VALUE ZEROS.
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQS.
           PERFORM PROCESSO.
           PERFORM FINALIZA.
           STOP RUN.
      *
       ABRE-ARQS.
      *
       PROCESSO.
      *
       FINALIZA.
