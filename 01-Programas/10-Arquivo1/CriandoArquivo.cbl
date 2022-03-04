      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CriandoArquivo.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
           FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
           01 REG-CLIENTE.
               05 CLIENTE-ID.
                   10 AGENCIA      PIC 9(03).
                   10 CONTA        PIC 9(06).
               05 NOME             PIC X(20).
               05 SALDO            PIC 9(07)V99.
      *
       WORKING-STORAGE SECTION.
           01 WS-FS                PIC X(02) VALUE SPACES.
      *
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM GRAVA-REG.
           CLOSE CADCLI.
           STOP RUN.
      *
       ABRE-ARQ.
           OPEN OUTPUT CADCLI.
           IF WS-FS NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
      *
       GRAVA-REG.
           CLOSE CADCLI.
           OPEN EXTEND CADCLI.
      *
           MOVE 001                 TO AGENCIA.
           MOVE 002346              TO CONTA.
           MOVE "Manuel de Almeida" TO NOME.
           MOVE 010367.90           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 001                 TO AGENCIA.
           MOVE 209856              TO CONTA.
           MOVE "Joao da Silva"     TO NOME.
           MOVE 001298.20           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 001                 TO AGENCIA.
           MOVE 201834              TO CONTA.
           MOVE "Alfredo das Neves" TO NOME.
           MOVE 000845.00           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 012                 TO AGENCIA.
           MOVE 300427              TO CONTA.
           MOVE "Maria Aparecida"   TO NOME.
           MOVE 045280.00           TO SALDO.
           WRITE REG-CLIENTE.
