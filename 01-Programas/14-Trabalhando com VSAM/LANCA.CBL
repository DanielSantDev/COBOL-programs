       IDENTIFICATION DIVISION.
       PROGRAM-ID. LANCA.
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO CLI
              ORGANIZATION IS INDEXED
              ACCESS MODE IS DYNAMIC
              RECORD KEY IS ID-CLI
              FILE STATUS IS WS-FS-CLI.
           SELECT MOVIM ASSIGN TO MOV
              ORGANIZATION IS INDEXED
              ACCESS MODE IS SEQUENTIAL
              RECORD KEY IS ID-MOV
              FILE STATUS IS WS-FS-MOV.
      *
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI.
       01 REG-CLI.
          03 ID-CLI.
             05 AGENCIA-CLI        PIC 9(03).
             05 CONTA-CLI          PIC 9(06).
          03 NOME-CLI              PIC X(20).
          03 SALDO                 PIC S9(07)V99.
      *
       FD MOVIM.
       01 REG-MOV.
           03 ID-MOV.
               05 AGENCIA-MOV      PIC 9(03).
               05 CONTA-MOV        PIC 9(06).
           03 MOVIMENTO            PIC S9(07)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-REG-CLI.
           03 WS-ID-CLI.
               05 WS-AGENCIA-CLI   PIC 9(03).
               05 WS-CONTA-CLI     PIC 9(06).
           03 WS-NOME-CLI          PIC X(20).
           03 WS-SALDO             PIC S9(07)V99.
       01 WS-MOVIMENTO             PIC S9(07)V99.
       01 WS-NOVOSALDO             PIC S9(07)V99 VALUE ZEROS.
       01 WS-NOVOSALDO-E           PIC -Z.ZZZ.ZZ9,99.
       01 WS-FS-CLI                PIC X(02) VALUE ZEROS.
       01 WS-FS-MOV                PIC X(02) VALUE ZEROS.
       01 WS-FIM-CLI               PIC X(01) VALUE 'N'.
       01 WS-FIM-MOV               PIC X(01) VALUE 'N'.
      *
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO UNTIL WS-FIM-MOV = 'S'.
           PERFORM FINALIZA.
           STOP RUN.
      *
       ABRE-ARQ.
           OPEN I-O CADCLI.
           IF WS-FS-CLI NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA CLIENTE- " WS-FS-CLI
             STOP RUN.
           OPEN INPUT MOVIM.
           IF WS-FS-MOV NOT EQUAL "00"
               DISPLAY "ERRO DE ABERTURA MOVIM - " WS-FS-MOV
           STOP RUN.
      *
       PROCESSO.
      *    ----------------------------------------
      *    LEITURA SEQUENCIAL DOS REGISTROS
      *    ----------------------------------------
           READ MOVIM AT END MOVE 'S' TO WS-FIM-MOV.
           IF WS-FIM-MOV = 'N'
               MOVE ID-MOV     TO ID-CLI
               MOVE MOVIMENTO  TO WS-MOVIMENTO
               PERFORM PESQUISA-CONTA
               PERFORM ATUALIZA-SALDO
           END-IF.
      *
       PESQUISA-CONTA.
      *    ----------------------------------------
      *    LEITURA INDEXADA DOS REGISTROS
      *    ----------------------------------------
           READ CADCLI.
           IF WS-FS-CLI EQUAL "00"
               MOVE REG-CLI TO WS-REG-CLI
               MOVE 'A' TO WS-FIM-CLI
           ELSE
               MOVE 'S' TO WS-FIM-CLI.
      *
       ATUALIZA-SALDO.
           IF WS-FIM-CLI = 'A'
               COMPUTE WS-NOVOSALDO = WS-SALDO + WS-MOVIMENTO
               MOVE WS-NOVOSALDO TO SALDO WS-NOVOSALDO-E
               DISPLAY "CONTA: " ID-MOV " - ATUALIZADA " WS-NOVOSALDO-E
               PERFORM REGRAVA-CLI.
           IF WS-FIM-CLI = 'S'
               DISPLAY "CONTA: " ID-MOV " - CONTA NAO ENCONTRADA".
      *
       REGRAVA-CLI.
           MOVE WS-REG-CLI TO REG-CLI
           REWRITE REG-CLI.
           IF WS-FS-CLI NOT EQUAL "00"
               DISPLAY "ERRO DE ABERTURA CLIENTE - " WS-FS-CLI
               STOP RUN.
      *
       FINALIZA.
           DISPLAY "FIM DO PROGRAMA"
           CLOSE CADCLI.
           CLOSE MOVIM.
