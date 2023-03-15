*&------------------------------------------------ ---------------------*
*&ReportYTEST_CS_PA05_04
*&------------------------------------------------ ---------------------*
*&
*&------------------------------------------------ ---------------------*

REPORT YTEST_CS_PA05_04.

TABLES: SFLIGHT.
DATA: LT_TABLE TYPE TABLE OF ZFLIGHT_PA5.
DATA: LS_TABLE TYPE ZFLIGHT_PA5.

PARAMETERS: LV_CAID LIKE SFLIGHT-CARRID.

CALL FUNCTION 'ZT_TEST_CS_FLIGHT_TAB'
EXPORTING
    IV_CARRID= LV_CAID
TABLES
    T_FLIGHT= LT_TABLE.

LOOP AT LT_TABLE INTO LS_TABLE.
WRITE: / SY-TABIX, LS_TABLE-CARRID, LS_TABLE-CONNID, LS_TABLE-PRICE, LS_TABLE-FLDATE, /.
ENDLOOP.