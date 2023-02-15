*&------------------------------------------------ ---------------------*

*&ReportYTEST_CS_PA03_101

*&------------------------------------------------ ---------------------*

*& 1. 입력 받는 값 없이 전체 데이터 추출

*&------------------------------------------------ ---------------------*

REPORT YTEST_CS_PA03_101.

TABLES SFLIGHT.

TYPES : BEGIN OF TP_DEF,
        CARRID TYPE SFLIGHT-CARRID,
        CONNID TYPE SFLIGHT-CONNID,
        FLDATE TYPE SFLIGHT-FLDATE,
        PRICE TYPE SFLIGHT-PRICE,
END OF TP_DEF.

DATA:LS_DATA TYPE TP_DEF.
DATA:LS_TABLE TYPE TABLE OF TP_DEF.

PERFORM get_data.
PERFORM dsp_data.

INCLUDE ytest_cs_pa03_101_get_dataf01.

INCLUDE ytest_cs_pa03_101_dsp_dataf01.

FORM GET_DATA.
    SELECT SF~CARRID SF~CONNID SF~FLDATE SF~PRICE
    INTO CORRESPONDING FIELDS OF TABLE LS_TABLE
    FROM SFLIGHT AS SF.
ENDFORM.

FORM DSP_DATA.
    LOOP AT LS_TABLE INTO LS_DATA.
        WRITE: / LS_DATA-CARRID, LS_DATA-CONNID, LS_DATA-FLDATE, LS_DATA-PRICE,/.
    ENDLOOP.
ENDFORM.