      ******************************************************************
      * Author: DanielSantDev
      * Date: 19/02
      * Purpose: Trabalhar com datas em COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  WS-NOME       PIC X(30).
           01  WS-DATA-INICIO.
               02 WS-DIA-I   PIC 9(02).
               02 BARRA1-I   PIC X(01).
               02 WS-MES-I   PIC X(02).
               02 BARRA2-I   PIC X(01).
               02 WS-ANO-I   PIC X(02).
           01  WS-DATA-FIM.
               02 WS-DIA-F   PIC X(02).
               02 WS-MES-F   PIC X(02).
               02 WS-ANO-F   PIC X(04).
       PROCEDURE DIVISION.
       RECEBE-DADOS.
           MOVE ZEROS TO WS-DATA-INICIO.
           MOVE ZEROS TO WS-DATA-FIM.
           DISPLAY "DIGITE SEU NOME: ".
           ACCEPT WS-NOME.
           DISPLAY "DIGITE A DATA INICIAL: "
           ACCEPT WS-DATA-INICIO.
           DISPLAY "DIGITE A DATA FINAL: "
           ACCEPT WS-DATA-FIM.
           DISPLAY WS-DATA-INICIO.
           DISPLAY WS-DATA-FIM.
      *
       CALCULO-DATAS.

           STOP RUN.
