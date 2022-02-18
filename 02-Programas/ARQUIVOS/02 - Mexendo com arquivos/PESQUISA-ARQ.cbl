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
           SELECT CADCLI ASSIGN TO DISK
              ORGANIZATION IS SEQUENTIAL
              ACCESS MODE IS SEQUENTIAL
              FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
       01 CLIENTE-FILE.
           05 CLIENTE-ID.
              10 AGENCIA    PIC 9(03).
              10 CONTA      PIC 9(06).
           05 NOME          PIC X(20).
           05 SALDO         PIC 9(07)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-CLIENTE-FILE.
           05 WS-CLIENTE-ID.
              10 WS-AGENCIA PIC 9(03).
              10 WS-CONTA   PIC 9(06).
           05 WS-NOME       PIC X(20).
           05 WS-SALDO      PIC 9(07)V99.
       01 WS-SALDO-E        PIC Z.ZZZ.ZZ9,99.
       01 WS-FS             PIC X(02) VALUE SPACES.
       01 WS-FIM            PIC X(01) VALUE 'N'.
      *
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           CLOSE CADCLI.
           STOP RUN.
       ABRE-ARQ.
           OPEN I-O CADCLI.
      *    abre o arquivo e permite alteração e leitura dos registros
           IF WS-FS NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
       PROCESSO.
           PERFORM ENTRA-DADOS.
           PERFORM LER-REG UNTIL WS-FIM = 'S' OR 'A'.
           PERFORM MOSTRA-REG.
       ENTRA-DADOS.
           DISPLAY 'ENTRE COM A AGENCIA: '.
           ACCEPT WS-AGENCIA.
           DISPLAY 'ENTRE COM A CONTA CORRENTE: '.
           ACCEPT WS-CONTA.
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
