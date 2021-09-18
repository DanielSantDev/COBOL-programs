       IDENTIFICATION DIVISION.
       PROGRAM-ID. PG3.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
      ***
      *** DEFINE OS ARQUIVOS DE ENTRADA E SAIDA
      ***
       FILE-CONTROL.
           SELECT ARQCAD ASSIGN TO "CADASTR.DAT"
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS ST-ALU.
           SELECT CADHOMEM ASSIGN TO "CADHOME.DAT"
           ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS ST-HOM.
           SELECT CADMULHE  ASSIGN TO "CADMULH.DAT"
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE IS SEQUENTIAL
             FILE STATUS IS ST-MUL.
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
        FD  CADHOMEM.
        01  REG-CADH.
            05  MATRICH.
                10  CO-ANOH     PIC  9(02).
                10  CO-NUMEROH  PIC  9(03).
                10  CO-DIGITOH  PIC  9(01).
            05  NOMEH    PIC  X(30).
            05  SEXOH    PIC  X(01).
            05  NOTA-PROVAH  PIC  9(02)V99.
       FD  CADMULHE.
       01  REG-CADM.
            05  MATRICM.
                10  CO-ANOM     PIC  9(02).
                10  CO-NUMEROM  PIC  9(03).
                10  CO-DIGITOM  PIC  9(01).
            05  NOMEM    PIC  X(30).
            05  SEXOM    PIC  X(01).
            05  NOTA-PROVAM  PIC  9(02)V99.
       WORKING-STORAGE SECTION.
       01 WS-DADOS.
           02  FIM-ARQ      PIC 9(01).
           02  ST-ALU       PIC X(02).
           02  ST-HOM       PIC X(02).
           02  ST-MUL       PIC X(02).
           02  MEDIA-M      PIC 9(02)V99.
           02  MEDIA-H      PIC 9(02)V99.
           02  TOTALH       PIC 9(02).
           02  TOTALM       PIC 9(02).
           02  TOTPRH       PIC 9(04)V99.
           02  TOTPRM       PIC 9(04)V99.
           02  EDICAO-M     PIC Z9,99.
           02  EDICAO-H     PIC Z9,99.
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           MOVE ZEROS TO WS-DADOS.
           PERFORM PROCESSO.
           PERFORM FINALIZA.
           STOP RUN.
       ABRE-ARQ.
           OPEN INPUT ARQCAD.
           IF ST-ALU NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - CAD ALUNO' ST-ALU
              STOP RUN.
           OPEN OUTPUT CADHOMEM.
           IF ST-HOM NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - CAD HOMEM' ST-HOM.
           OPEN OUTPUT CADMULHE.
           IF ST-MUL NOT EQUAL '00'
              DISPLAY 'ERRO DE ABERTURA - CAD MULHE' ST-MUL.
       PROCESSO.
           READ ARQCAD AT END MOVE 1 TO FIM-ARQ.
           PERFORM LER-ARQ UNTIL FIM-ARQ = 1.
           PERFORM MOSTRA-TOTAL.
       LER-ARQ.
           IF SEXO = "F"
              PERFORM GRAVA-MULHER
           ELSE
              PERFORM GRAVA-HOMEM.
           READ ARQCAD  AT END MOVE 1 TO FIM-ARQ.
       GRAVA-MULHER.
           ADD       1     TO TOTALM.
           ADD NOTA-PROVA  TO TOTPRM.
           MOVE REG-ALUNO  TO REG-CADM.
           WRITE REG-CADM.
       GRAVA-HOMEM.
           ADD       1     TO TOTALH.
           ADD NOTA-PROVA  TO TOTPRH.
           MOVE REG-ALUNO  TO REG-CADH.
           WRITE REG-CADH.
       MOSTRA-TOTAL.
           COMPUTE MEDIA-M = TOTPRM / TOTALM.
           COMPUTE MEDIA-H = TOTPRH / TOTALH.
           MOVE MEDIA-M TO EDICAO-M.
           MOVE MEDIA-H TO EDICAO-H.
           DISPLAY ' MEDIA FINAL SEM EDICAO MULHER =' MEDIA-M.
           DISPLAY ' MEDIA FINAL SEM EDICAO HOMEM  =' MEDIA-H.
           DISPLAY ' MEDIA FINAL MULHER =' EDICAO-M.
           DISPLAY ' MEDIA FINAL HOMEM  =' EDICAO-H.
       FINALIZA.
           CLOSE ARQCAD
                 CADHOMEM
                 CADMULHE.
