*&------------------------------------------------ ---------------------*

*&Report YTEST_CS_PA05_02

*&------------------------------------------------ ---------------------*

*&

*&------------------------------------------------ ---------------------*

REPORT YTEST_CS_PA05_02.

PARAMETERS: LV_NUM1 TYPE I,
            LV_NUM2 TYPE I.
DATA : LV_SUM TYPE I.

CALL FUNCTION 'ZT_TEST_CS_ADD'
EXPORTING
P_NUM1 = LV_NUM1
P_NUM2 = LV_NUM2

IMPORTING
SUM = LV_SUM.

WRITE : '결과가', LV_SUM, /.