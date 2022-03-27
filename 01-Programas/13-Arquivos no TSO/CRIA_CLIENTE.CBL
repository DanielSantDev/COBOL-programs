       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGRAVA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO DISK
              ORGANIZATION IS SEQUENTIAL
              ACCESS MODE IS SEQUENTIAL
              FILE STATUS IS WS-FS-CLI.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
       01 REG-CLI.
          03 ID-CLI.
             05 AGENCIA-CLI        PIC 9(03).
             05 CONTA-CLI          PIC 9(06).
          03 NOME-CLI              PIC X(20).
          03 SALDO                 PIC S9(06)V99.

       WORKING-STORAGE SECTION.
       01 WS-FS-CLI           PIC X(02) VALUE ZEROS.
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM GRAVA-REG-CLI.
           PERFORM GRAVA-REG-MOV.
           CLOSE CADCLI.
           CLOSE MOVIMEN.
           STOP RUN.

       ABRE-ARQ.
           OPEN OUTPUT CADCLI.
           IF WS-FS-CLI NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA CLIENTE - " WS-FS-CLI
             STOP RUN.
 
       GRAVA-REG-CLI.
           CLOSE CADCLI.
           OPEN EXTEND CADCLI.

           MOVE 001                 TO AGENCIA-CLI.
           MOVE 002222              TO CONTA-CLI.
           MOVE "Manuel de Almeida" TO NOME-CLI.
           MOVE 001000000            TO SALDO.
           WRITE REG-CLI.

           MOVE 001                 TO AGENCIA-CLI.
           MOVE 011111              TO CONTA-CLI.
           MOVE "Joao da Silva"     TO NOME-CLI.
           MOVE 002000000            TO SALDO.
           WRITE REG-CLI.

           MOVE 001                 TO AGENCIA-CLI.
           MOVE 033333              TO CONTA-CLI.
           MOVE "Alfredo das Neves" TO NOME-CLI.
           MOVE 003500000            TO SALDO.
           WRITE REG-CLI.

           MOVE 012                 TO AGENCIA-CLI.
           MOVE 044444              TO CONTA-CLI.
           MOVE "Maria Aparecida" TO NOME-CLI.
           MOVE 004200000            TO SALDO.
           WRITE REG-CLI.

