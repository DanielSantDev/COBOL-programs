       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME PIC X(30).
       01 WS-ID   PIC 9(05) VALUE 12345.
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY 'PRIMEIRO PROGRAMA'.
           MOVE 'seu nome' TO WS-NAME.
           DISPLAY 'Meu nome �: ' WS-NAME.
           DISPLAY 'Meu n�mero � : ' WS-ID.
           STOP RUN.
