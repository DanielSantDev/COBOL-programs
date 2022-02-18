      ******************************************************************
      * Author: DanielSantDev
      * Date: 18/02
      * Purpose: Calcula area da circuferencia
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AreaCircuferencia.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 DADOS.
              05 W-RAIO         PIC 9(03)V99.
              05 W-AREA         PIC 9(05)V99.
           01 DATA-DO-SISTEMA.
              02 W-ANO          PIC 9(02).
              02 W-MES          PIC 9(02).
              02 W-DIA          PIC 9(02).
           01 W-ANO-COMPLETO.
              02 W-ANO-S        PIC 9(02).
              02 W-ANO-D        PIC 9(02).
       PROCEDURE DIVISION.
           ACCEPT DATA-DO-SISTEMA FROM DATE.
           MOVE    W-ANO TO W-ANO-D.
           IF W-ANO-D < 35
               MOVE 20 TO W-ANO-S
           ELSE
               MOVE 19 TO W-ANO-S.
           MOVE ZEROS  TO DADOS.
           DISPLAY 'ENTRE COM O VALOR DO RAIO'
           ACCEPT W-RAIO.
           COMPUTE W-AREA = 3.1416 * (W-RAIO ** 2).
           DISPLAY 'AREA DA CIRCUNFERENCIA: ' W-AREA.
           DISPLAY 'DATA: ' W-DIA'/'W-MES'/'W-ANO-COMPLETO.
           DISPLAY "FIM DO PROGRAMA".
           STOP RUN.
