       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULADORA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
            COPY ZUTZCWS     .
       77 NUM1	PIC S9(05)V99 VALUE 0.
       77 NUM2	PIC S9(05)V99 VALUE 0.
       77 RESULTADO PIC 9(05)V99 VALUE 0.
       77 OPERACION PIC A(01).

       PROCEDURE DIVISION.
           PERFORM UT-INITIALIZE

           DISPLAY SPACE
           DISPLAY "TEST SUITE:"
           DISPLAY
           'CALCULATOR'
           DISPLAY SPACE

           MOVE 'OPERACION IS AN ADD'
               TO UT-TEST-CASE-NAME
           PERFORM UT-BEFORE
           SET OPERACION TO "a"
           ADD 1 TO UT-TEST-CASE-COUNT
           SET UT-NORMAL-COMPARE TO TRUE
           MOVE OPERACION TO UT-ACTUAL
           MOVE "a"
                       TO UT-EXPECTED
           SET UT-COMPARE-DEFAULT TO TRUE
           PERFORM UT-ASSERT-EQUAL
           PERFORM UT-AFTER
            COPY ZUTZCPD     .
           .
       UT-BEFORE.

           .
       UT-AFTER.

           .
       UT-INITIALIZE.
           MOVE SPACES TO UT-FILE-INFORMATION

           .
       UT-END.

           DISPLAY NUM1
           .
	   ACCEPT NUM1 FROM ARGUMENT-VALUE
           .
	   ACCEPT NUM2 FROM ARGUMENT-VALUE
           ACCEPT OPERACION FROM ARGUMENT-VALUE
           .
	   IF OPERACION = "a" THEN
               ADD NUM1 TO NUM2 GIVING RESULTADO
           .
	   IF OPERACION = "m" THEN
               SUBTRACT NUM1 FROM NUM2 GIVING RESULTADO
           .
	   IF OPERACION = "M" THEN
               MULTIPLY NUM1 BY NUM2 GIVING RESULTADO
           .
	   IF OPERACION = "d" THEN
               DIVIDE NUM1 INTO NUM2 GIVING RESULTADO
           DISPLAY RESULTADO
           .
       STOP RUN.
