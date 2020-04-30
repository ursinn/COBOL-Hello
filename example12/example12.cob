       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. example11.
AUTHOR. Ursin Filli
DATE-WRITTEN. April 30th 2020
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.
DATA DIVISION.
FILE SECTION.
FD CustomerFile.
01 CustomerData.
       02 IDNum    PIC 9(5).
       02 CustName.
           03 FirstName    PIC X(15).
           03 LastName     PIC X(15).

WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSIDNum  PIC 9(5).
       02 WSCustName.
           03 WSFirstName    PIC X(15).
           03 WSLastName     PIC X(15).
01 WSEOF PIC A(1).
PROCEDURE DIVISION.
OPEN INPUT CustomerFile.
       PERFORM UNTIL WSEOF='Y'
           READ CustomerFile INTO WSCustomer
               AT END MOVE 'Y' TO WSEOF
               NOT AT END DISPLAY WSCustomer
           END-READ
        END-PERFORM
CLOSE CustomerFile.

STOP RUN.
