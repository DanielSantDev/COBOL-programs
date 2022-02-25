      ******************************************************************
      * Author: DanielSantDev
      * Date: 25/02/2022
      * Purpose: calcular uma eq. do segundo grau
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EqSegundoGrau.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
      *    TROCA OS PONTOS POR VÍRGULAS
           DECIMAL-POINT IS COMMA.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
           01 DADOS.
               02 WS-VAR-A             PIC S9(02)V9.
               02 WS-VAR-B             PIC S9(02)V9.
               02 WS-VAR-C             PIC S9(02)V9.
               02 WS-VAR-X1            PIC S9(02)V99.
               02 WS-VAR-X2            PIC S9(02)V99.
               02 WS-DELTA             PIC S9(02)V99.
      *
           01 DADOS-E.
               02 WS-VAR-A-E           PIC -Z9,9.
               02 WS-VAR-B-E           PIC -Z9,9.
               02 WS-VAR-C-E           PIC -Z9,9.
               02 WS-VAR-X1-E          PIC -Z9,99.
               02 WS-VAR-X2-E          PIC -Z9,99.
               02 WS-DELTA-E           PIC -Z9,99.
      *
           01 WS-ANO-COMP.
               02 WS-SECULO            PIC 9(02).
               02 WS-DECADA            PIC 9(02).
      *
           01 DATA-DO-SISTEMA.
               02 WS-ANO               PIC 9(02).
               02 WS-MES               PIC 9(02).
               02 WS-DIA               PIC 9(02).
      *
       PROCEDURE DIVISION.
       ENTRADA-DATA.
           ACCEPT DATA-DO-SISTEMA FROM DATE.
           MOVE ZEROS TO DADOS-E.
           DISPLAY "CALCULO DA EQUACAO DO SEGUNDO GRAU".
           IF WS-ANO > 35
               MOVE 19 TO WS-SECULO
           ELSE
               MOVE 20 TO WS-SECULO.
           MOVE WS-ANO TO WS-DECADA.
           DISPLAY "DATA DO SISTEMA = " WS-DIA"/"WS-MES"/"WS-ANO-COMP.
      *
       ENTRADA-DADOS.
           DISPLAY "DIGITE O VALOR DE A: "
           ACCEPT WS-VAR-A-E.
           MOVE WS-VAR-A-E TO WS-VAR-A.
           DISPLAY "DIGITE O VALOR DE B: "
           ACCEPT WS-VAR-B-E.
           MOVE WS-VAR-B-E TO WS-VAR-B.
           DISPLAY "DIGITE O VALOR DE C: "
           ACCEPT WS-VAR-C-E.
           MOVE WS-VAR-C-E TO WS-VAR-C.
      *
       CALCULA.
           IF WS-VAR-A <> 0
               COMPUTE WS-DELTA =(WS-VAR-B**2)-(4 * WS-VAR-A * WS-VAR-C)
               MOVE WS-DELTA TO WS-DELTA-E
               DISPLAY "VALOR DO DELTA = " WS-DELTA-E
               IF WS-DELTA < 0
                   DISPLAY "NAO EXISTE RAIZES REAIS"
               ELSE
                   IF WS-DELTA = 0
                       COMPUTE WS-VAR-X1 = -WS-VAR-B / (2  * WS-VAR-A)
                       MOVE WS-VAR-X1 TO WS-VAR-X1-E
                       DISPLAY "EXISTE SOMENTE UMA RAIZ: " WS-VAR-X1-E
                   ELSE
                     COMPUTE WS-DELTA = FUNCTION SQRT (WS-DELTA)
                     COMPUTE WS-VAR-X1=(-WS-VAR-B+WS-DELTA)/(2*WS-VAR-A)
                     COMPUTE WS-VAR-X2=(-WS-VAR-B+WS-DELTA)/(2*WS-VAR-A)
                     DISPLAY "EXISTEM DUAS RAIZES"
                     MOVE WS-VAR-X1 TO WS-VAR-X1-E
                     MOVE WS-VAR-X2 TO WS-VAR-X2-E
                     DISPLAY "X1: "WS-VAR-X1-E
                     DISPLAY "X1: "WS-VAR-X2-E.
      *
           FIM-PROGRAMA.
               DISPLAY "FIM DE PROGRAMA".
           STOP RUN.
