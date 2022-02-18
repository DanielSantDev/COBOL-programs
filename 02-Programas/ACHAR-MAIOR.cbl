      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACHARMARIO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMEROS.
           02 WS-NUM1  PIC 9(04)99.
           02 WS-NUM2  PIC 9(04)99.
       PROCEDURE DIVISION.
           ACCEPT WS-NUM1.
           ACCEPT WS-NUM2.
           IF WS-NUM1 > WS-NUM2
               DISPLAY "O NUMERO " WS-NUM1 "É MAIOR QUE " WS-NUM2
           ELSE
               DISPLAY "O NUMERO " WS-NUM2 "É MAIOR QUE " WS-NUM1
           END-IF.
       STOP RUN.
