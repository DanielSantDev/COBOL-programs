      ******************************************************************
      * Author: DanielSantDev
      * Date: 04/03/2022
      * Purpose: ALTERA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTERA.
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    SELECT CADCLI ASSIGN CADC
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
           05 SALDO         PIC 9(07)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-NOME           PIC X(20).
       01 WS-CLIENTE-ID.
           10 WS-AGENCIA    PIC 9(03).
           10 WS-CONTA      PIC 9(06).
       01 WS-FS             PIC X(02) VALUE ZEROS.
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
           IF WS-FS NOT EQUAL "00"
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
       PROCESSO.
           PERFORM ENTRA-DADOS.
           PERFORM LER-REG UNTIL WS-FIM = 'S' OR 'A'.
           IF WS-FIM = 'A'
               PERFORM REGRAVA-REG
           ELSE
               DISPLAY 'REGISTRO NAO ENCONTRADO'.
       ENTRA-DADOS.
           DISPLAY 'ENTRE COM A AGENCIA: '.
           ACCEPT WS-AGENCIA.
           DISPLAY 'ENTRE COM A CONTA CORRENTE: '.
           ACCEPT WS-CONTA.
       LER-REG.
           READ CADCLI AT END MOVE 'S' TO WS-FIM.
           IF WS-CLIENTE-ID = CLIENTE-ID THEN
              MOVE 'A'     TO WS-FIM
           END-IF.
       REGRAVA-REG.
           DISPLAY 'ENTRE COM A ALTERAÇÃO DO NOME: '.
           ACCEPT WS-NOME.
           MOVE WS-NOME TO NOME.
           REWRITE CLIENTE-FILE.
           IF WS-FS EQUAL "00"
              DISPLAY 'REGISTRO GRAVADO COM SUCESSO'
           ELSE
              DISPLAY 'ERRO DE GRAVACAO - ' WS-FS.
