        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLOA.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-NOME-ESTUDANTE PIC X(25).
        01 WS-DATA PIC X(10).
        PROCEDURE DIVISION.
            ACCEPT WS-NOME-ESTUDANTE.
            ACCEPT WS-DATA FROM DATE.
            DISPLAY "Name : " WS-NOME-ESTUDANTE.
            DISPLAY "Date : " WS-DATA.
            STOP RUN. 