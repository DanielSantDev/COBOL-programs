        IDENTIFICATION DIVISION.
        PROGRAM-ID. PGM01.
        ENVIRONMENT DIVISION.
        DATA DIVISION.
        WORKING-STORAGE SECTION. 
        01 WS-PEGADATA.
           05 WS-DATA.
              10 WS-ANO    PIC 99.
              10 WS-MES    PIC 99.
              10 WS-DIA    PIC 99. 
           05 WS-ANOEXT. 
              10 WS-CCEXT PIC 99.
              10 WS-AAEXT PIC 99.
        01 TABELA-MES. 
           05 WS-MESES. 
              10 FILLER      PIC X(10) VALUE 'JANEIRO'.  
              10 FILLER      PIC X(10) VALUE 'FEVEREIRO'. 
              10 FILLER      PIC X(10) VALUE 'MARCO'. 
              10 FILLER      PIC X(10) VALUE 'ABRIL'.
              10 FILLER      PIC X(10) VALUE 'MAIO'. 
              10 FILLER      PIC X(10) VALUE 'JUNHO'.
              10 FILLER      PIC X(10) VALUE 'JULHO'. 
              10 FILLER      PIC X(10) VALUE 'AGOSTO'. 
              10 FILLER      PIC X(10) VALUE 'SETEMBRO'. 
              10 FILLER      PIC X(10) VALUE 'OUTUBRO'. 
              10 FILLER      PIC X(10) VALUE 'NOVEMBRO'.
              10 FILLER      PIC X(10) VALUE 'DEZEMBRO'.
           05 FILLER REDEFINES WS-MESES.
              10 TB-MES      PIC X(10) OCCURS 12. 
        PROCEDURE DIVISION.
        INICIO. 
              ACCEPT WS-DATA FROM DATE. 
              MOVE WS-ANO TO WS-AAEXT.
              IF  WS-AAEXT GREATER  50 
                  MOVE  19  TO  WS-CCEXT
              ELSE
                  MOVE  20  TO  WS-CCEXT 
              END-IF. 
              DISPLAY 'HOJE E ' WS-DIA ' DE ' TB-MES(WS-MES) ' DE '
                      WS-ANOEXT.
              STOP RUN.