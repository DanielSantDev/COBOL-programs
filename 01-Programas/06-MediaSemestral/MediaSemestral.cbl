      ******************************************************************
      * Author: DanielSantDev
      * Date:
      * Purpose:CALCULAR MEDIA DO SEMESTRE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MediaSemestral.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-NOME PIC X(20).
           01 WS-NOTAS.
               02 WS-NOTA1     PIC 9(02)V9.
               02 WS-NOTA2     PIC 9(02)V9.
               02 WS-NOTA3     PIC 9(02)v9.
               02 WS-MEDIA     PIC 9(02)V9.
      *
       PROCEDURE DIVISION.
       ENTRADA-DE-DADOS.
           MOVE ZEROS TO WS-NOTAS.
           DISPLAY 'DIGITE SEU NOME: '.
           ACCEPT WS-NOME.
           DISPLAY 'DIGITE A PRIMEIRA NOTA: '.
           ACCEPT WS-NOTA1.
           DISPLAY 'DIGITE A SEGUNDA NOTA: '.
           ACCEPT WS-NOTA2.
      *
       MEDIA.
           COMPUTE WS-MEDIA = (WS-NOTA1 + WS-NOTA2 / 2).
           IF WS-MEDIA < 6
               DISPLAY "SUA MEDIA FOI: " WS-MEDIA
               DISPLAY 'DIGITE A TERCEIRA NOTA: '
               ACCEPT WS-NOTA3
               IF WS-NOTA1 > WS-NOTA2
                   COMPUTE WS-MEDIA = (WS-NOTA1 + WS-NOTA3) / 2
               ELSE
                   COMPUTE WS-MEDIA = (WS-NOTA2 + WS-NOTA3) / 2
           END-IF.
      *
       MOSTRA-RESULTADO-FINAL.
           IF WS-MEDIA < 6
               DISPLAY "VOCE FOI REPROVADO"
               DISPLAY "SUA MEDIA " WS-MEDIA
           ELSE
               DISPLAY "VOCE FOI APROVADO"
               DISPLAY "SUA MEDIA " WS-MEDIA
           END-IF.
           STOP RUN.
