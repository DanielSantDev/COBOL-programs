       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGISTRA-CLI.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQCAD ASSIGN TO "CLIENTE.DAT"
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS ST-ALU.
       DATA DIVISION.
       FILE SECTION.
       FD  ARQCAD.
       01  REG-CLI.
            03  ID-CLI.
                05  AGENCIA    PIC  9(03).
                05  CONTA      PIC  9(06).
            03  NOME-CLI       PIC  X(20).
            03  SALDO          PIC  S9(09).
       WORKING-STORAGE SECTION.
       77  ST-ALU       PIC X(02).
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           PERFORM FINALIZA.
           STOP RUN.
       ABRE-ARQ.
           OPEN OUTPUT ARQCAD.
           IF ST-ALU NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - CAD ALUNO' ST-ALU
              STOP RUN.
       PROCESSO.
           MOVE 001 TO AGENCIA.
           MOVE 002222 TO CONTA.
           MOVE 'Manuel de Almeida' TO NOME-CLI.
           MOVE 001000000 TO SALDO.
           WRITE REG-CLI.

           MOVE 001 TO AGENCIA.
           MOVE 011111 TO CONTA.
           MOVE 'Joao da Silva' TO NOME-CLI.
           MOVE 002000000 TO SALDO.
           WRITE REG-CLI.

           MOVE 001 TO AGENCIA.
           MOVE 033333 TO CONTA.
           MOVE 'Alfredo das Neves' TO NOME-CLI.
           MOVE 003500000 TO SALDO.
           WRITE REG-CLI.

           MOVE 012 TO AGENCIA.
           MOVE 044444 TO CONTA.
           MOVE 'Maria Aparecida' TO NOME-CLI.
           MOVE 004200000 TO SALDO.
           WRITE REG-CLI.
      *
       FINALIZA.
           CLOSE ARQCAD.
