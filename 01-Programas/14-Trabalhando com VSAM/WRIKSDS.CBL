       IDENTIFICATION DIVISION.
       PROGRAM-ID. KSDSWRI.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT CADCLI ASSIGN TO CLI
            ORGANIZATION IS INDEXED
            ACCESS MODE IS SEQUENTIAL
            RECORD KEY IS ID-CLI
            FILE STATUS IS WS-FS-CLI.
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI.
       01 REG-CLI.
          03 ID-CLI.
             05 AGENCIA-CLI        PIC 9(03).
             05 CONTA-CLI          PIC 9(06).
          03 NOME-CLI              PIC X(20).
          03 SALDO-CLI             PIC 9(09).
       WORKING-STORAGE SECTION.
       01 OPTION     PIC X(3) VALUE 'YES'.
       01 WS-FS-CLI  PIC X(2) VALUE SPACES.
       PROCEDURE DIVISION.
       INICIO.
            PERFORM ABRE-ARQ.
            PERFORM GRAVA-REG UNTIL OPTION = 'NO'.
            PERFORM FINALIZA.
            STOP RUN.
       ABRE-ARQ.
            OPEN OUTPUT CADCLI.
            if WS-FS-CLI NOT = '00'
               DISPLAY 'ERRO DE ABERTURA - ' WS-FS-CLI
               STOP RUN.
       GRAVA-REG.
            ACCEPT ID-CLI.
            ACCEPT NOME-CLI.
            ACCEPT SALDO-CLI.
            DISPLAY REG-CLI.
            WRITE REG-CLI INVALID KEY DISPLAY 'ERRO DE GRAVACAO'.
            IF WS-FS-CLI = '00'
               DISPLAY 'REGISTRO INSERIDO COM SUCESSO'
            ELSE
               DISPLAY 'ERRO DE GRAVACAO, STATUS: ' WS-FS-CLI
            END-IF.
            ACCEPT OPTION.
        FINALIZA.
            CLOSE CADCLI.
            DISPLAY 'FIM DA GRAVACAO'.
