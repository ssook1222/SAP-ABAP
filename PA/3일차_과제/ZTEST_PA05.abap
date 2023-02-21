*&---------------------------------------------------------------------*
*& Report YTEST_CS_PA03_105
*&---------------------------------------------------------------------*
*& 항공사 코드를 입력받아 데이터 추출 (입력 받기 전 기본값은 'AA'로 설정)
*&---------------------------------------------------------------------*

REPORTYTEST_CS_PA03_104.

TABLES SFLIGHT.

TYPES : BEGIN OF TP_DEF,
        CARRID TYPE SFLIGHT-CARRID,
        CONNID TYPE SFLIGHT-CONNID,
        FLDATE TYPE SFLIGHT-FLDATE,
        PRICE TYPE SFLIGHT-PRICE,
END OF TP_DEF.


DATA : LS_DATA TYPE TP_DEF.
DATA : LS_TABLE TYPE TABLE OF TP_DEF.

PARAMETERS : CODE LIKE SFLIGHT-CARRID LENGTH 2 DEFAULT 'AA'.

PERFORM get_data.
PERFORM dsp_data.

INCLUDE ytest_cs_pa03_103_get_dataf01.
INCLUDE ytest_cs_pa03_103_dsp_dataf01.