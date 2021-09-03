       IDENTIFICATION DIVISION.
       PROGRAM-ID. AREA-DE-UM-CIRCULO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DADOS.
           05 W-RAIO  PIC 9(03)V99.
           05 W-AREA  PIC 9(05)V99.
       01 DATA-DO-SISTEMA.
           05 W-ANO PIC 9(02).
           05 W-MES PIC 9(02).
           05 W-DIA PIC 9(02).
       PROCEDURE DIVISION.
           ACCEPT DATA-DO-SISTEMA FROM DATE.
      *COMANDO BÁSICO PARA OBTER DATA, HORA E DIA DO SisOper.
           MOVE ZEROS TO DADOS.
           ACCEPT W-RAIO.
           COMPUTE W-AREA = 3.1416 * (W-RAIO ** 2).
      *
           DISPLAY "Area = " W-AREA.
           DISPLAY "Data do Sistema = " W-DIA "/" W-MES "/" W-ANO.
           DISPLAY "FIM DO PROGRAMA".
           STOP RUN.
