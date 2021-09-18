       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVIMENTACAO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO DISK
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS-CLI.
           SELECT MOVIM ASSIGN TO DISK
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS-MOV.
           SELECT MOVLOG ASSIGN TO DISK
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS-LOG.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
       01 REG-CLI.
           03 ID-CLI.
               05 AGENCIA-CLI      PIC 9(03).
               05 CONTA-CLI        PIC 9(06).
           03 NOME-CLI             PIC X(20).
           03 SALDO                PIC S9(09).
      *
       FD MOVIM VALUE OF FILE-ID IS "MOVIMENTO.DAT".
       01 REG-MOV.
           03 ID-MOV.
               05 AGENCIA-MOV      PIC 9(03).
               05 CONTA-MOV        PIC 9(06).
           03 MOVIMENTO            PIC S9(09).
      *
       FD MOVLOG VALUE OF FILE-ID IS "LOGMOV.DAT".
       01 REG-LOG.
           03 ID-LOG.
               05 AGENCIA-LOG      PIC 9(03).
               05 CONTA-LOG        PIC 9(06).
           03 DESCRICAO-LOG        PIC X(20).
           03 VALOR-LOG            PIC S9(09).
      *
       WORKING-STORAGE SECTION.
       01 WS-ID.
           03 WS-AGENCIA           PIC 9(03).
           03 WS-CONTAG            PIC 9(06).
       01 WS-MOVIMENTO             PIC S9(09) VALUE ZEROS.
       01 WS-SALDO                 PIC S9(09) VALUE ZEROS.
       01 WS-NOVOSALDO             PIC S9(09) VALUE ZEROS.
       01 WS-FS-CLI                PIC X(02) VALUE ZEROS.
       01 WS-FS-MOV                PIC X(02) VALUE ZEROS.
       01 WS-FS-LOG                PIC X(02) VALUE ZEROS.
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
               DISPLAY "ERRO DE ABERTURA CLIENTE -" WS-FS-CLI
               STOP RUN.
           OPEN INPUT MOVIM.
           IF WS-FS-MOV NOT EQUAL "00"
               DISPLAY "ERRO DE ABERTURA MOVIM -" WS-FS-MOV.
               STOP RUN.
           OPEN OUTPUT MOVLOG.
           IF WS-FS-LOG NOT EQUAL "00"
               DISPLAY "ERRO DE AVERTURA LOG -" WS-FS-LOG.
               STOP RUN.
           CLOSE MOVLOG.
           OPEN EXTEND MOVLOG.
      *
       PROCESSO.
           READ MOVIM AT END MOVE 'S' TO WS-FIM-MOV.
           IF WS-FIM-MOV = 'N'
               MOVE ID-MOV     TO WS-ID
               MOVE MOVIMENTO  TO WS-MOVIMENTO
               CLOSE CADCLI
               OPEN I-O CADCLI
               MOVE 'N' TO WS-FIM-CLI
               PERFORM PESQUISA-CONTA UNTIL WS-FIM-CLI = 'S' OR 'A'
               PERFORM ATUALIZA-SALDO
           END-IF.
      *
       PESQUISA-CONTA.
           READ CADCLI
              AT END
               MOVE 'S' TO WS-FIM-CLI
              NOT AT END
               IF WS-ID = ID-CLI
                   MOVE SALDO  TO WS-SALDO
                   MOVE 'A'    TO WS-FIM-CLI
               END-IF
           END-READ.
      *
       ATUALIZA-SALDO.
           MOVE WS-ID TO ID-LOG.
              IF WS-FIM-CLI = 'A'
                  COMPUTE WS-NOVOSALDO = WS-SALDO + WS-MOVIMENTO
                  MOVE WS-NOVOSALDO            TO SALDO VALOR-LOG
                  DISPLAY WS-NOVOSALDO " - " WS-MOVIMENTO
                  PERFORM REGRAVA-CLI
                  MOVE 'CONTA ATUALIZADA'      TO DESCRICAO-LOG.
              IF WS-FIM-CLI = 'S'
                  MOVE 'CONTA NÃO ENCONTRADA'  TO DESCRICAO-LOG
                  MOVE WS-MOVIMENTO            TO VALOR-LOG.
              PERFORM GRAVA-LOG.
      *
       REGRAVA-CLI.
           REWRITE REG-CLI.
           IF WS-FS-CLI NOT EQUAL "00"
               DISPLAY "ERRO DE GRAVAÇÃO CLIENTE - " WS-FS-CLI
               STOP RUN.
      *
       GRAVA-LOG.
           WRITE REG-LOG.
           IF WS-FS-LOG NOT EQUAL "00"
               DISPLAY "ERRO DE GRAVAÇÃO DE LOG - " WS-FS-LOG
               STOP RUN.
      *
       FINALIZA.
           CLOSE CADCLI.
           CLOSE MOVIM.
           CLOSE MOVLOG.
