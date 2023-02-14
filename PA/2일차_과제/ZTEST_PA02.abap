REPORT YTEST_CS_PA02_02.
START-OF-SELECTION.
TABLES SCARR.
TABLES SFLIGHT.

TYPES : BEGIN OF TP_DEF,
        CARRID TYPE SFLIGHT-CARRID,
        CONNID TYPE SFLIGHT-CONNID,
        FLDATE TYPE SFLIGHT-FLDATE,
        PRICE TYPE SFLIGHT-PRICE,
        CARRNAME TYPE SCARR-CARRNAME,
        CURRCODE TYPE SCARR-CURRCODE,
        URL TYPE SCARR-URL,
        END OF TP_DEF.

DATA : LS_DATA TYPE TP_DEF.
DATA : LS_TABLE TYPE TABLE OF TP_DEF.

INCLUDE YTEST_CS_PA02_02_TOP.
SELECT-OPTIONS : SO_CAID FOR SFLIGHT-CARRID.
PERFORM get_data
USING SO_CAID-LOW SO_CAID-HIGH
CHANGING gv_subrc.
   PERFORM dsp_data.

INCLUDE YTEST_CS_230207_06_GET_DATAF01.
INCLUDE YTEST_CS_230207_06_DSP_DATAF01.

*&------------------------------------------------ ---------------------*

*&IncludeYTEST_CS_PA02_02_TOP

*&------------------------------------------------ ---------------------*
DATA:GV_SUBRC TYPE SY-SUBRC.


*------------------------------------------------- ---------------------*
***INCLUDE YTEST_CS_230207_06_GET_DATAF01.
*------------------------------------------------- ---------------------*
*&------------------------------------------------ ---------------------*
*&Form GET_DATA
*&------------------------------------------------ ---------------------*
* &text
*&------------------------------------------------ ---------------------*
*<--P_GV_SUBRC text
*&------------------------------------------------ ---------------------*

FORM GET_DATA
USING SEARCH1 SEARCH2
CHANGING P_GV_SUBRC.

    SELECT SC~CARRID SF~CONNID SF~FLDATE SF~PRICE SC~CARRNAME SC~CURRCODE SC~URL
    INTO CORRESPONDING FIELDS OF TABLE LS_TABLE
    FROM SFLIGHT AS SF
    INNER JOIN SCARR AS SC
    ON SC~CARRID = SF~CARRID
    WHERE SC~CARRID = SEARCH1 OR SC~CARRID = SEARCH2.

ENDFORM.


*------------------------------------------------- ---------------------*

***INCLUDE YTEST_CS_230207_06_DSP_DATAF01.

*------------------------------------------------- ---------------------*

*&------------------------------------------------ ---------------------*

*&FormDSP_DATA

*&------------------------------------------------ ---------------------*

FORM DSP_DATA.
    IF SY-SUBRC<>0.
        WRITE:'No data found'.
        EXIT.
    ENDIF.

    LOOP AT LS_TABLE INTO LS_DATA.
        WRITE : /LS_DATA-CARRID , LS_DATA-CONNID , LS_DATA-FLDATE ,
                LS_DATA-PRICE , LS_DATA-CARRNAME , LS_DATA-CURRCODE
                , LS_DATA-URL , / .
    ENDLOOP.
ENDFORM.

