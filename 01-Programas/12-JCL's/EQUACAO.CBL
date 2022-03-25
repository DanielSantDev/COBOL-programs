       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EQUACAO.
       ENVIRONMENT DIVISION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
        01 DADOS.
           02 WS-A        PIC  S9(03).
           02 WS-B        PIC  S9(03).
           02 WS-C        PIC  S9(03).
           02 WS-X1       PIC  S9(03)V9.
           02 WS-X2       PIC  S9(03)V9.
           02 WS-D        PIC  S9(03)V9.
           02 WS-X1-E     PIC  -ZZ9.99.
           02 WS-X2-E     PIC  -ZZ9.99.
           02 WS-D-E      PIC  -ZZ9.99.
      *
       PROCEDURE DIVISION.
       INICIO.
           MOVE ZEROS TO DADOS.
           ACCEPT WS-A.
           ACCEPT WS-B.
           ACCEPT WS-C.
      *
       CALCULA.
           IF WS-A not equal 0
              COMPUTE WS-D = WS-B ** 2 - (4 * WS-A * WS-C)
              MOVE WS-D TO WS-D-E
              DISPLAY "Delta = " WS-D-E
              IF WS-D < 0
                 DISPLAY "Nao existe raizes"
              ELSE
                 IF WS-D = 0
                    COMPUTE WS-X1 = - WS-B / (2 * WS-A)
                    MOVE WS-X1 TO WS-X1-E
                    DISPLAY "Existe somente uma raiz"
                    DISPLAY "X1 = " WS-X1-E
                 ELSE
                    COMPUTE WS-D = FUNCTION SQRT (WS-D)
                    COMPUTE WS-X1 = - WS-B + WS-D / (2 * WS-A)
                    MOVE WS-X1 to WS-X1-E
                    COMPUTE WS-X2 = - WS-B - WS-D / (2 * WS-A)
                    MOVE WS-X2 to WS-X2-E
                    DISPLAY "Existem duas Raizes"
                    DISPLAY "X1: " WS-X1-E
                    DISPLAY "X2: " WS-X2-E
           ELSE
              DISPLAY "Nao eh equacao do segundo grau" .
      *
       FINALIZA.
           DISPLAY "fim  do  programa".
           STOP RUN.
