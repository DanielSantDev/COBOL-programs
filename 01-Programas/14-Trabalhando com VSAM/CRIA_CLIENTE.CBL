       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGRAVA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO CLI
              ORGANIZATION IS INDEXED
              ACCESS MODE IS SEQUENTIAL
              RECORD KEY IS ID-CLI
              FILE STATUS IS WS-FS-CLI.
           SELECT MOVIME ASSIGN TO MOV
              ORGANIZATION IS INDEXED
              ACCESS MODE IS SEQUENTIAL
              RECORD KEY IS ID-MOV
              FILE STATUS IS WS-FS-MOV.
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
       FD MOVIME.
       01 REG-MOV.
           03 ID-MOV.
               05 AGENCIA-MOV      PIC 9(03).
               05 CONTA-MOV        PIC 9(06).
           03 MOVIMENTO            PIC S9(07)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-FS-CLI           PIC X(02) VALUE ZEROS.
       01 WS-FS-MOV           PIC X(02) VALUE ZEROS.
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM GRAVA-REG-CLI.
           DISPLAY "INCLUSAO DE CLIENTES BEM SUCEDIDO"
           PERFORM GRAVA-REG-MOV.
           DISPLAY "INCLUSAO DE MOVIMENTO BEM SUCEDIDA"
           CLOSE CADCLI.
           CLOSE MOVIME.
           STOP RUN.
      *
       ABRE-ARQ.
           OPEN OUTPUT CADCLI.
           IF WS-FS-CLI NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA CLIENTE - " WS-FS-CLI
             STOP RUN.
           OPEN OUTPUT MOVIME.
           IF WS-FS-MOV NOT EQUAL "00"
               DISPLAY "ERRO DE ABERTURA MOVIMENTO - " WS-FS-MOV
               STOP RUN.
      *
       GRAVA-REG-CLI.
           MOVE 001                 TO AGENCIA-CLI.
           MOVE 002222              TO CONTA-CLI.
           MOVE "Manuel de Almeida" TO NOME-CLI.
           MOVE 0010000.00          TO SALDO.
           WRITE REG-CLI.
           IF WS-FS-CLI NOT EQUAL "00"
               DISPLAY "ERRO DE GRAVACAO - " WS-FS-CLI
               DISPLAY REG-CLI
               STOP RUN.
           MOVE 001                 TO AGENCIA-CLI.
           MOVE 011111              TO CONTA-CLI.
           MOVE "Joao da Silva"     TO NOME-CLI.
           MOVE 0020000.00          TO SALDO.
           WRITE REG-CLI.

           MOVE 001                 TO AGENCIA-CLI.
           MOVE 033333              TO CONTA-CLI.
           MOVE "Alfredo das Neves" TO NOME-CLI.
           MOVE 0035000.00          TO SALDO.
           WRITE REG-CLI.

           MOVE 012                 TO AGENCIA-CLI.
           MOVE 044444              TO CONTA-CLI.
           MOVE "Maria Aparecida"   TO NOME-CLI.
           MOVE 0042000.00          TO SALDO.
           WRITE REG-CLI.
      *
       GRAVA-REG-MOV.
           MOVE 001                 TO AGENCIA-MOV.
           MOVE 002222              TO CONTA-MOV.
           MOVE 0000500.00          TO MOVIMENTO.
           WRITE REG-MOV.
           IF WS-FS-MOV NOT EQUAL "00"
               DISPLAY "ERRO DE GRAVACAO MOVIMENTO"
               DISPLAY WS-FS-MOV
               STOP RUN.
      *
           MOVE 001                 TO AGENCIA-MOV.
           MOVE 011111              TO CONTA-MOV.
           MOVE 0002500.00          TO MOVIMENTO.
           WRITE REG-MOV.
      *
           MOVE 001                 TO AGENCIA-MOV.
           MOVE 031313              TO CONTA-MOV.
           MOVE 0005500.00          TO MOVIMENTO.
           WRITE REG-MOV.
      *
           MOVE 012                 TO AGENCIA-MOV.
           MOVE 044444              TO CONTA-MOV.
           MOVE -002000.00          TO MOVIMENTO.
           WRITE REG-MOV.
