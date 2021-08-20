      ******************************************************************
      * Author:DANIEL
      * Date:20/08/2021
      * Purpose:CALCULAR EQUAÇÕES DO SEGUNDO GRAU
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 DADOS.
           02 WS-A     PIC S9(02)V9.
           02 WS-B     PIC S9(02)V9.
           02 WS-C     PIC S9(02)V9.
           02 WS-X1    PIC S9(03)V9.
           02 WS-X2    PIC S9(03)V9.
           02 WS-D     PIC S9(03)V9.

       PROCEDURE DIVISION.
       ENTRADA-DE-DADOS.
           DISPLAY 'ENTRE COM A: '
           ACCEPT WS-A.
           IF WS-A = 0
               DISPLAY 'A VARIAVEL A NAO PODE SER 0'
               STOP RUN
           ELSE
               DISPLAY 'ENTRE COM B: '
               ACCEPT WS-B
               DISPLAY 'ENTRE COM C: '
               ACCEPT WS-C
           END-IF.

       CALCULO-DELTA.
           COMPUTE WS-D = ( WS-B ** 2 ) - (4 * WS-A * WS-C).

       CALCULO-RAIZES.
           IF WS-D < 0
               DISPLAY 'RAIZ REAL NAO EXISTE.'
               STOP RUN

           ELSE WS-D = 0
               COMPUTE WS-A
               DISPLAY

            STOP RUN.
