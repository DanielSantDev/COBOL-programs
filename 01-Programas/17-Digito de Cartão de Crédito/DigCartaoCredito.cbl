      ******************************************************************
      * Author:DanielSantDev
      * Date:20/05/2022
      * Purpose:verificar digito do cartao de credito
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIGCART.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CARTAO.
           05 WS-NUM-CAR            PIC X(16) VALUE ZEROES.
           05 WS-NUM-CAR-R          REDEFINES WS-NUM-CAR.
               10 WS-NUM-CAR-T      PIC 9(01) OCCURS 16 TIMES.
      *
       01 WS-CARTAO2.
           05 WS-NUM-CAR2           PIC X(32) VALUE ZEROES.
           05 WS-NUM-CAR-R2         REDEFINES WS-NUM-CAR2.
               10 WS-NUM-CAR-T2     PIC 9(02) OCCURS 16 TIMES.
      *
       01 WS-DADOS.
           05 WS-SOMA               PIC 9(3).
           05 WS-VOLTA              PIC 9(2) VALUE ZEROES.
      *
      *---------------------------------------------------------
       PROCEDURE DIVISION.
      *---------------------------------------------------------
       ENTRADA-DE-DADOS.
           ACCEPT WS-NUM-CAR.
           IF WS-NUM-CAR IS NOT ZERO
               THEN
                   MOVE ZEROS TO WS-DADOS
                   MOVE ZEROS TO WS-CARTAO2
                   MOVE 1     TO WS-VOLTA
                   PERFORM PROCEDIMENTO-PRINCIPAL
               ELSE
                   STOP RUN
               END-IF.
      *
       PROCEDIMENTO-PRINCIPAL.
      *    ----------------------------------------------------
           PERFORM DOBRA-VALOR  UNTIL WS-VOLTA = 16.
      *    ----------------------------------------------------
           MOVE 1     TO WS-VOLTA.
           PERFORM SUBTRAI-NUM UNTIL WS-VOLTA = 16.
      *    ----------------------------------------------------
           MOVE 1     TO WS-VOLTA.
           PERFORM SOMA-NUM     UNTIL WS-VOLTA = 16.
           COMPUTE WS-SOMA = WS-SOMA + WS-NUM-CAR-T(16).
      *    ----------------------------------------------------
           IF FUNCTION MOD(WS-SOMA, 10) IS ZERO
               THEN
                   DISPLAY "O NUMERO: " WS-NUM-CAR ", EH VALIDO"
               ELSE
                   DISPLAY "O NUMERO: " WS-NUM-CAR ", NAO EH VALIDO"
               END-IF.
                 DISPLAY "SOMA  : " WS-SOMA.
           PERFORM ENTRADA-DE-DADOS.
      *
       DOBRA-VALOR.
           IF FUNCTION MOD(WS-VOLTA, 2) IS NOT ZERO
               THEN
                   COMPUTE WS-NUM-CAR-T2(WS-VOLTA) =
                   WS-NUM-CAR-T(WS-VOLTA) * 2
               ELSE
                   COMPUTE WS-NUM-CAR-T2(WS-VOLTA) =
                   WS-NUM-CAR-T(WS-VOLTA)
               END-IF.
           ADD 1 TO WS-VOLTA.
      *
       SUBTRAI-NUM.
           IF WS-NUM-CAR-T2(WS-VOLTA) >= 10
               THEN
                   COMPUTE WS-NUM-CAR-T2(WS-VOLTA) =
                   WS-NUM-CAR-T2(WS-VOLTA) - 9.
           ADD 1 TO WS-VOLTA.
      *
       SOMA-NUM.
           COMPUTE WS-SOMA = WS-SOMA + WS-NUM-CAR-T2(WS-VOLTA).
           ADD 1 TO WS-VOLTA.
