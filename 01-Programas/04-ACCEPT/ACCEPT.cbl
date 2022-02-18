      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TrabalhandoComAccept.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-NOME-ESTUDANTE PIC X(25).
           01 WS-DATA PIC X(10).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "DIGITE O NOME DO ESTUDANTE: ".
           ACCEPT WS-NOME-ESTUDANTE.
           ACCEPT WS-DATA FROM DATE.
           DISPLAY "NOME: " WS-NOME-ESTUDANTE.
           DISPLAY "DATE: " WS-DATA
           STOP RUN.
