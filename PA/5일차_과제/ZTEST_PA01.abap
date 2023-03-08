*&------------------------------------------------ ---------------------*
*&Report YTEST_CS_PA05_01
*&------------------------------------------------ ---------------------*
*&
*&------------------------------------------------ ---------------------*

REPORT YTEST_CS_PA05_01.

TABLES SFLIGHT.

PARAMETERS: LV_CAIDLIKESFLIGHT-CARRID LENGTH 2.

DATA: LV_PRICE LIKE SFLIGHT-PRICE.
DATA: LT_TABLE LIKE TABLE OF ZFLIGHT230213.

SELECT SF~CARRID SF~CONNID SF~FLDATE SF~PRICE
INTO CORRESPONDING FIELDS OF TABLE LT_TABLE
FROM SFLIGHT AS SF.

CALL FUNCTION 'ZF_TEST_CS_PA05'

EXPORTING
IV_CARRID = LV_CAID

IMPORTING
E_PRICE = LV_PRICE

TABLES
T_FLIGHT = LT_TABLE.

*EXCEPTIONS
*NO_DATA=1
*OTHERS=2

IF SY-SUBRC <> 0.
    WRITE: 'No data', /.
ENDIF.

WRITE : LV_PRICE.