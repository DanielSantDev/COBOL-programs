      ******************************************************************
      * Author: DANIEL
      * Date:19/08/2021
      * Purpose:CALCULAR M�DIA DE UM ALUNO
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MEDIA-NOTA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NOME           PIC X(30).
       01 DADOS.
           05 WS-NOTA1      PIC 9(02)V9.
           05 WS-NOTA2      PIC 9(02)V9.
           05 WS-NOTA3      PIC 9(02)V9.
           05 WS-MEDIA      PIC 9(02)V9.
       01 WS-CONT           PIC X(01).
       01 DADOS-E.
           05 WS-NOTA1-E    PIC Z9.9.
           05 WS-NOTA2-E    PIC Z9.9.
           05 WS-NOTA3-E    PIC Z9.9.
           05 WS-MEDIA-E    PIC Z9.9.
      *
       PROCEDURE DIVISION.
       ENTRADA-DADOS.
           MOVE ZEROS TO DADOS.
           DISPLAY "ENTRE COM O NOME:".
           ACCEPT WS-NOME.
           DISPLAY "ENTRE COM A NOTA 1: ".
           ACCEPT WS-NOTA1-E.
           DISPLAY "ENTRE COM A NOTA 2: ".
           ACCEPT WS-NOTA2-E.
           MOVE WS-NOTA1-E TO WS-NOTA1.
           MOVE WS-NOTA2-E TO WS-NOTA2.
      *
       CALCULA-MEDIA.
           COMPUTE WS-MEDIA = (WS-NOTA1 + WS-NOTA2) / 2.
           MOVE WS-MEDIA TO WS-MEDIA-E.
           DISPLAY "MEDIA: " WS-MEDIA-E.
           IF WS-MEDIA < 5.75
              DISPLAY "ENTRE COM A NOTA 3: ".
              ACCEPT WS-NOTA3-E.
              IF WS-NOTA1 >= WS-NOTA2
                 COMPUTE WS-MEDIA = (WS-MEDIA + WS-NOTA1) / 2
              ELSE
                 COMPUTE WS-MEDIA = (WS-MEDIA + WS-NOTA2) / 2.
      *
       MOSTRA-RESULTADO.
           MOVE WS-MEDIA TO WS-MEDIA-E.
           DISPLAY "MEDIA FINAL: " WS-MEDIA-E.
           DISPLAY "ALUNO : " WS-NOME.
           IF WS-MEDIA < 6
              DISPLAY "REPROVADO"
           ELSE
              DISPLAY "APROVADO".
           STOP RUN.
