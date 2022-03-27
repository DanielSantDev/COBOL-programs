       IDENTIFICATION DIVISION.
       PROGRAM-ID. PESQUISA.
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
            DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *      SELECT CADCLI ASSIGN CADC
           SELECT CADCLI ASSIGN TO DISK
              ORGANIZATION IS SEQUENTIAL
              ACCESS MODE IS SEQUENTIAL
              FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
      * FD CADCLI
      *      RECORDING MODE IS F.
       01 CLIENTE-FILE.
           05 CLIENTE-ID.
              10 AGENCIA    PIC 9(03).
              10 CONTA      PIC 9(06).
           05 NOME          PIC X(20).
           05 SALDO         PIC 9(06)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-CLIENTE-FILE.
           05 WS-CLIENTE-ID.
              10 WS-AGENCIA PIC 9(03).
              10 WS-CONTA   PIC 9(06).
           05 WS-NOME       PIC X(20).
           05 WS-SALDO      PIC 9(06)V99.
       01 WS-SALDO-E        PIC ZZZ.ZZ9,99.
       01 WS-FS             PIC X(02) VALUE SPACES.
       01 WS-FIM            PIC X(01) VALUE 'N'.
      *
       PROCEDURE DIVISION.
       INICIO.
           ACCEPT WS-AGENCIA.
           ACCEPT WS-CONTA.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           PERFORM MOSTRA-REG.
           CLOSE CADCLI.
           STOP RUN.
       ABRE-ARQ.
           OPEN I-O CADCLI.
           IF WS-FS NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
       PROCESSO.
           PERFORM LER-REG UNTIL WS-FIM = 'S' OR 'A'.
       LER-REG.
           READ CADCLI AT END MOVE 'S' TO WS-FIM.
           IF WS-CLIENTE-ID = CLIENTE-ID THEN
               MOVE CLIENTE-FILE TO WS-CLIENTE-FILE
               MOVE 'A'          TO WS-FIM
           END-IF.
       MOSTRA-REG.
           IF WS-FIM = 'A'
              DISPLAY "AGENCIA: " WS-AGENCIA
              DISPLAY "CONTA: " WS-CONTA
              DISPLAY "NOME: " WS-NOME
              MOVE WS-SALDO TO WS-SALDO-E
              DISPLAY "SALDO: " WS-SALDO-E
           ELSE
              DISPLAY 'REGISTRO NAO ENCONTRADO'.
