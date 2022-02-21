      ******************************************************************
      * Author:
      * Date: 13/08/2020
      * Purpose: CALCULAR APOSENTADORIA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. APOSENTA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NOME           PIC X(30).
       01 WS-DATA-INI.
          02 WS-DIA-INI     PIC 9(02).
          02 BARRA1-INI     PIC X(01).
          02 WS-MES-INI     PIC 9(02).
          02 BARRA2-INI     PIC X(01).
          02 WS-ANO-INI     PIC 9(04).
       01 WS-DATA-FIM.
          02 WS-DIA-FIM     PIC 9(02).
          02 BARRA1-FIM     PIC X(01).
          02 WS-MES-FIM     PIC 9(02).
          02 BARRA2-FIM     PIC X(01).
          02 WS-ANO-FIM     PIC 9(04).
       01 WS-DIAS           PIC 9(02).
       01 WS-MESES          PIC 9(02).
       01 WS-ANOS           PIC 9(02).
       01 WS-FALTA          PIC 9(02).
       PROCEDURE DIVISION.
       ENTRADA-DE-DADOS.
           DISPLAY 'ENTRE COM O SEU NOME: '.
           ACCEPT WS-NOME.
           DISPLAY 'ENTRE COM A DATA INICIAL (dd/mm/aaaa): '.
           ACCEPT WS-DATA-INI.
           DISPLAY 'ENTRE COM A DATA FINAL (dd/mm/aaaa): '.
           ACCEPT WS-DATA-FIM.

       CLACULO-DA-DATA.
           IF WS-DIA-INI > WS-DIA-FIM
               ADD 30 TO WS-DIA-FIM
               SUBTRACT 1 FROM WS-MES-FIM.
           COMPUTE WS-DIAS = WS-DIA-FIM - WS-DIA-INI.
           IF WS-MES-INI > WS-MES-FIM
               ADD 12 TO WS-MES-FIM
               SUBTRACT 1 FROM WS-ANO-FIM.
           COMPUTE WS-MESES = WS-MES-FIM - WS-MES-INI.
           COMPUTE WS-ANOS = WS-ANO-FIM - WS-ANO-INI.
           COMPUTE WS-FALTA = 35 - WS-ANOS.

       MOSTRA-RESULTADO.
           DISPLAY 'RESULTADO DOS CALCULOS - ' WS-NOME.
           DISPLAY "JA TRABALHOU: ".
           DISPLAY WS-ANOS" ANOS "WS-MESES" MESES E "WS-DIAS" DIAS".
           DISPLAY "FATAM " WS-FALTA " ANOS PARA A APOSENTADORIA".
           DISPLAY "FIM DO PROGRAMA".
           STOP RUN.
