       IDENTIFICATION DIVISION.
       PROGRAM-ID. CalculaDigitoCNPJ.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DADOS.
           05 WS-NUMERO             PIC X(14).
           05 FILLER REDEFINES WS-NUMERO.
               10 WS-DIGITO1        PIC 9(1) OCCURS 14 TIMES.
      *
           05 WS-NUMERO-R           PIC 9(28).
           05 FILLER REDEFINES WS-NUMERO-R.
               10 WS-DIGITO2        PIC 9(2) OCCURS 14 TIMES.
      *
           05 WS-PESOS              PIC X(13) VALUE '6543298765432'.
           05 WS-PESOS-R            REDEFINES WS-PESOS.
               10 WS-PESOS-T        PIC 9(01) OCCURS 13 TIMES.
      *
           05 WS-LACO1              PIC 9(2) VALUE 1.
           05 WS-LACO2              PIC 9(2) VALUE 1.
           05 WS-RESULTADO          PIC 9(3).
      *
       PROCEDURE DIVISION.
       PROCEDIMENTO-INICIAL.
           DISPLAY "DIGITE O CNPJ: ".
           ACCEPT WS-NUMERO.
      *
       PROCEDIMENTO-PRINCIPAL.
           PERFORM UNTIL WS-LACO1 = 13
               COMPUTE WS-LACO1 = WS-LACO1 + 1
               COMPUTE WS-LACO2 = WS-LACO1 - 1
               COMPUTE WS-DIGITO2(WS-LACO2) = WS-DIGITO1(WS-LACO2) *
               WS-PESOS-T(WS-LACO1)
               COMPUTE WS-RESULTADO= WS-RESULTADO + WS-DIGITO2(WS-LACO2)
           END-PERFORM.
      *
           COMPUTE WS-RESULTADO = FUNCTION REM (WS-RESULTADO , 11).
           COMPUTE WS-RESULTADO = 11 - WS-RESULTADO.
           IF WS-RESULTADO > 2
               COMPUTE WS-DIGITO1(13) = WS-RESULTADO
           ELSE
               COMPUTE WS-DIGITO1(13) = 0
           END-IF.
      *
           MOVE 0 TO WS-LACO1.
           MOVE 0 TO WS-RESULTADO.
      *
           PERFORM UNTIL WS-LACO1 = 13
               COMPUTE WS-LACO1 = WS-LACO1 + 1
               COMPUTE WS-DIGITO2(WS-LACO1) = WS-DIGITO1(WS-LACO1) *
               WS-PESOS-T(WS-LACO1)
               COMPUTE WS-RESULTADO= WS-RESULTADO + WS-DIGITO2(WS-LACO1)
           END-PERFORM.
      *
           COMPUTE WS-RESULTADO = FUNCTION REM (WS-RESULTADO, 11).
           COMPUTE WS-RESULTADO = 11 - WS-RESULTADO.
           IF WS-RESULTADO > 2
               COMPUTE WS-DIGITO1(14) = WS-RESULTADO
           ELSE
               COMPUTE WS-DIGITO1(14) = 0
           END-IF.
      *
       PROCEDIMENTO-FINAL.
           DISPLAY "CNPJ = " WS-NUMERO
           STOP RUN.
