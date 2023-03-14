*&------------------------------------------------ ---------------------*
*&Report YTEST_CS_PA05_03
*&------------------------------------------------ ---------------------*
*&
*&------------------------------------------------ ---------------------*

REPORT YTEST_CS_PA05_03.

PARAMETERS : LV_NUM1 TYPE I,
             LV_NUM2 TYPE I,
             LV_CMD TYPE C.

DATA: LV_NUM TYPE F,
      LV_ANS TYPE P DECIMALS 11.

IF LV_NUM1 = 0 OR LV_NUM2 = 0.
    WRITE:'0으로 계산불가.' .
    EXIT.
ENDIF.

CALL FUNCTION 'ZF_TEST_CS_CAL'
EXPORTING
    IV_NUM1= LV_NUM1
    IV_NUM2= LV_NUM2
    IV_CMD= LV_CMD
IMPORTING
    EV_NUM= LV_NUM.

LV_ANS = LV_NUM*10000000000/10000000000.

WRITE: LV_ANS.