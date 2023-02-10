PARAMETERS: NUM TYPE P.

DATA: CNT1 TYPE I VALUE 1,
      CNT2 TYPE I,
      RESULT TYPE I.

DO.
    IF NUM EQ 1.
        NUM = NUM + 1.
    ENDIF.

    CNT1 = CNT1+1.

    DO 9 TIMES.
        CNT2 = SY-INDEX.
        RESULT = CNT1 * CNT2.
        WRITE : / CNT1,'*', CNT2,'=', RESULT.
    ENDDO.

    IF NUM EQ CNT1.
        EXIT.
    ENDIF.

    SKIP.
ENDDO.