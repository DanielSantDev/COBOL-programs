       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRAVA.
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *     SELECT CADCLI ASSIGN CADC
           SELECT CADCLI ASSIGN TO DISK
              ORGANIZATION IS SEQUENTIAL
              ACCESS MODE IS SEQUENTIAL
              FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
      * FD CADCLI
      *     RECORDING MODE IS F.
       01 CLIENTE-FILE.
           05 CLIENTE-ID.
              10 AGENCIA    PIC 9(03).
              10 CONTA      PIC 9(06).
           05 NOME          PIC X(20).
           05 SALDO         PIC 9(06)V99.
       WORKING-STORAGE SECTION.
       01 WS-CLIENTE-FILE.
           05 WS-CLIENTE-ID.
              10 WS-AGENCIA PIC 9(03).
              10 WS-CONTA   PIC 9(06).
           05 WS-NOME       PIC X(20).
           05 WS-SALDO      PIC 9(06)V99.
       01 WS-FS             PIC X(02) VALUE ZEROS.
       01 WS-FIM            PIC X(01) VALUE 'N'.
       PROCEDURE DIVISION.
       INICIO.
           ACCEPT WS-AGENCIA.
           ACCEPT WS-CONTA.
           ACCEPT WS-NOME.
           ACCEPT WS-SALDO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           CLOSE CADCLI.
           STOP RUN.
       ABRE-ARQ.
           OPEN EXTEND CADCLI.
           IF WS-FS NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
       PROCESSO.
           MOVE WS-CLIENTE-FILE TO CLIENTE-FILE.
           WRITE CLIENTE-FILE.

