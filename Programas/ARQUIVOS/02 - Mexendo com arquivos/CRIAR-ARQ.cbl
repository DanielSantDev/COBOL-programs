       IDENTIFICATION DIVISION.
       PROGRAM-ID. REGRAVA.
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *seção para manipulação de arquivos
      *
       FILE-CONTROL.
      *características dos arquivos manipulados
      *
           SELECT CADCLI ASSIGN TO DISK
      *
              ORGANIZATION IS SEQUENTIAL
      *       organização dos registros de forma sequencial
              ACCESS MODE IS SEQUENTIAL
      *       acesso aos dados de forma sequencial
              FILE STATUS IS WS-FS.
      *       código de verificação para as operações I/O
      *
       DATA DIVISION.
       FILE SECTION.
       FD CADCLI VALUE OF FILE-ID IS "CLIENTE.DAT".
       01 REG-CLIENTE.
      *linha de registro
           05 CLIENTE-ID.
              10 AGENCIA    PIC 9(03).
              10 CONTA      PIC 9(06).
           05 NOME          PIC X(20).
           05 SALDO         PIC 9(07)V99.
      *
       WORKING-STORAGE SECTION.
       01 WS-FS         PIC X(02) VALUE SPACES.
      *mostra o status do programa
      *
       PROCEDURE DIVISION.
       INICIO.
           PERFORM ABRE-ARQ.
           PERFORM GRAVA-REG.
           CLOSE CADCLI.
           STOP RUN.
      *
       ABRE-ARQ.
           OPEN OUTPUT CADCLI.
      *    abre o arquivo e posiciona no primeiro registro
      *    cria um arquivo novo sequencial
           IF WS-FS NOT EQUAL "00"
      *    se diferente de 00 algo errado aconteceu
             DISPLAY "ERRO DE ABERTURA - " WS-FS
             STOP RUN.
      *
       GRAVA-REG.
           CLOSE CADCLI.
           OPEN EXTEND CADCLI.
      *    posiciona o arquivo para escrita no primeiro registro free
      *
           MOVE 001                 TO AGENCIA.
           MOVE 002346              TO CONTA.
           MOVE "Manuel de Almeida" TO NOME.
           MOVE 010367.90           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 001                 TO AGENCIA.
           MOVE 209856              TO CONTA.
           MOVE "Joao da Silva"     TO NOME.
           MOVE 001298.20           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 001                 TO AGENCIA.
           MOVE 201834              TO CONTA.
           MOVE "Alfredo das Neves" TO NOME.
           MOVE 000845.00           TO SALDO.
           WRITE REG-CLIENTE.
      *
           MOVE 012                 TO AGENCIA.
           MOVE 300427              TO CONTA.
           MOVE "Maria Aparecida"   TO NOME.
           MOVE 045280.00           TO SALDO.
           WRITE REG-CLIENTE.
