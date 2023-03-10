REPORT YTEST_CS_PA02_01.

DATA : BEGIN OF GS_LINE,
       CARRID TYPE SFLIGHT-CARRID,
       CONNID TYPE SFLIGHT-CONNID,
       PRICE TYPE SFLIGHT-PRICE,
       END OF GS_LINE.

DATA GT_ITAB LIKE TABLE OF GS_LINE WITH NON-UNIQUE KEY CARRID CONNID WITH HEADER LINE.
DATA GT_SUM LIKE TABLE OF GS_LINE WITH NON-UNIQUE KEY CARRID CONNID WITH HEADER LINE.

SELECT CARRID CONNID PRICE
INTO CORRESPONDING FIELDS OF TABLE GT_ITAB FROM SFLIGHT.

IF SY-SUBRC <> 0.
    WRITE:'No data found'.
ENDIF.

LOOP AT GT_ITAB.
COLLECT GT_ITAB INTO GT_SUM.
ENDLOOP.

LOOP AT GT_SUM
WRITE:/GT_SUM-CARRID, GT_SUM-CONNID, GT_SUM-PRICE.
ENDLOOP.