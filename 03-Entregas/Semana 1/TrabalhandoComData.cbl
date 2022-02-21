      ******************************************************************
      * Author: DanielSantDev
      * Date: 19/02
      * Purpose: Trabalhar com datas em COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULA-APOSENTADORIA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  WS-NOME       PIC X(30).
           01  WS-DATA-INICIO.
               02 WS-DIA-I           PIC 9(02).
               02 BARRA1-I           PIC X(01).
               02 WS-MES-I           PIC 9(02).
               02 BARRA2-I           PIC X(01).
               02 WS-ANO-I           PIC 9(04).
           01  WS-DATA-FIM.
               02 WS-DIA-F           PIC 9(02).
               02 BARRA1-F           PIC X(01).
               02 WS-MES-F           PIC 9(02).
               02 BARRA2-F           PIC X(01).
               02 WS-ANO-F           PIC 9(04).
           01  WS-DATA-APOSENTA.
               02  WS-DIA-APOSENTA   PIC 9(02).
               02  WS-MES-APOSENTA   PIC 9(02).
               02  WS-ANO-APOSENTA   PIC 9(02).
               02  WS-APOSENTADORIA  PIC 9(02).
       PROCEDURE DIVISION.
       RECEBE-DADOS.
           MOVE ZEROS TO WS-DATA-INICIO.
           MOVE ZEROS TO WS-DATA-FIM.
           MOVE ZEROS TO WS-DATA-APOSENTA.
           DISPLAY "DIGITE SEU NOME: ".
           ACCEPT WS-NOME.
           DISPLAY "DIGITE A DATA INICIAL: "
           ACCEPT WS-DATA-INICIO.
           DISPLAY "DIGITE A DATA FINAL: "
           ACCEPT WS-DATA-FIM.
      *
       CALCULO-DATAS.
           IF WS-DIA-I > WS-DIA-F
               COMPUTE WS-DIA-F = WS-DIA-F + 30
               COMPUTE WS-MES-F = WS-MES-F - 1.
           COMPUTE WS-DIA-APOSENTA = WS-DIA-F - WS-DIA-I.
           IF WS-MES-I > WS-MES-F
               COMPUTE WS-MES-F = WS-MES-F + 12
               COMPUTE WS-ANO-F = WS-ANO-F - 1.
           COMPUTE WS-MES-APOSENTA = WS-MES-F - WS-MES-I.
           COMPUTE WS-ANO-APOSENTA = WS-ANO-F - WS-ANO-I.
           COMPUTE WS-APOSENTADORIA = 35 - WS-ANO-APOSENTA.
      *
       IMPRIME-RESULTADOS.
           DISPLAY "CALCULADORA DE APOSENTADORIA".
           DISPLAY "OLA, " WS-NOME.
           DISPLAY "VOCE JÁ TRABALHOU: ".
           DISPLAY WS-ANO-APOSENTA " ANOS DE TRABALHO".
           DISPLAY WS-MES-APOSENTA " MESES DE TRABALHO".
           DISPLAY WS-DIA-APOSENTA " DIAS DE TRABALHO".
           DISPLAY "FALTAM "WS-APOSENTADORIA" ANOS PARA SE APOSENTAR".
           STOP RUN.
