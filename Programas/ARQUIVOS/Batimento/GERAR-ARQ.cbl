       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG3.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
      ***
      *** DEFINE OS ARQUIVOS DE ENTRADA E SAIDA
      ***
       FILE-CONTROL.
           SELECT ARQCAD ASSIGN TO "CADASTR.DAT"
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS ST-ALU.
       DATA DIVISION.
       FILE SECTION.
       FD  ARQCAD.
       01  REG-ALUNO.
            05  MATRIC.
                10  CO-ANO     PIC  9(02).
                10  CO-NUMERO  PIC  9(03).
                10  CO-DIGITO  PIC  9(01).
            05  NOME    PIC  X(30).
            05  SEXO    PIC  X(01).
            05  NOTA-PROVA  PIC  9(02)V99.
       WORKING-STORAGE SECTION.
       77  ST-ALU       PIC X(02).
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM PROCESSO.
           PERFORM FINALIZA.
           STOP RUN.
       ABRE-ARQ.
           OPEN OUTPUT ARQCAD.
           IF ST-ALU NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - CAD ALUNO' ST-ALU
              STOP RUN.
       PROCESSO.
           MOVE '180019' TO MATRIC.
           MOVE 'JOAO DAS NEVES                ' TO NOME.
           MOVE 'M' TO SEXO.
           MOVE 07.50 TO NOTA-PROVA.
           WRITE REG-ALUNO.

           MOVE '180029' TO MATRIC.
           MOVE 'MARIA JOAQUINA                ' TO NOME.
           MOVE 'F' TO SEXO.
           MOVE 05.50 TO NOTA-PROVA.
           WRITE REG-ALUNO.

           MOVE '180039' TO MATRIC.
           MOVE 'MARIA MADALENA DE JESUS       ' TO NOME.
           MOVE 'F' TO SEXO.
           MOVE 08.00 TO NOTA-PROVA.
           WRITE REG-ALUNO.

           MOVE '180049' TO MATRIC.
           MOVE 'ALBERT EINSTEN                ' TO NOME.
           MOVE 'M' TO SEXO.
           MOVE 09.50 TO NOTA-PROVA.
           WRITE REG-ALUNO.

           MOVE '180059' TO MATRIC.
           MOVE 'JOAOZINHO DA SILVA            ' TO NOME.
           MOVE 'M' TO SEXO.
           MOVE 02.00 TO NOTA-PROVA.
           WRITE REG-ALUNO.

       FINALIZA.
           CLOSE ARQCAD.
