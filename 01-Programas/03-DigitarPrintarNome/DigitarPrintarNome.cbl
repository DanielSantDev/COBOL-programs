      ******************************************************************
      * Author: DanielSantDev
      * Date:  08/02
      * Purpose: Type and print your name
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DigitarPrintarNome.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-NAME PIC A(30).
           01 WS-ID PIC 9(5) VALUE '12345'.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'FIRST PROGRAM'.
           MOVE 'DANIEL' TO WS-NAME.
           DISPLAY "YOUR NAME IS: " WS-NAME.
           DISPLAY "MY id IS: " WS-ID.
           STOP RUN.
       END PROGRAM DigitarPrintarNome.
