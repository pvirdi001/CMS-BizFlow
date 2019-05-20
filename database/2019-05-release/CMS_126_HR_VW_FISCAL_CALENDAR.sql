----------------------------------------------------------------------------
--Create Fiscal calendar View 
----------------------------------------------------------------------------
----------------------------------------------------------------------------
   
---------------------------------------------
--DDL for VW_FISCAL_CALENDAR
---------------------------------------------
   

  CREATE OR REPLACE FORCE VIEW "HHS_CMS_HR"."VW_FISCAL_CALENDAR" (SVRID, DAYTYPE, DAYOFWEEK
        , CALDTIME, "FISCAL_YEAR", "FISCAL_YEAR_NAME", "FISCAL_QUARTER", "FISCAL_QUARTER_NAME") AS 

  SELECT SVRID, DAYTYPE, DAYOFWEEK
          , CALDTIME
         , TO_CHAR(ADD_MONTHS(CALDTIME, 3), 'YYYY') AS FISCAL_YEAR
         , 'FY ' || TO_CHAR(ADD_MONTHS(CALDTIME, 3), 'YYYY') AS FISCAL_YEAR_NAME
         , TO_CHAR(ADD_MONTHS(CALDTIME, 3), 'Q') FISCAL_QUARTER
         , 'Q' || TO_CHAR(ADD_MONTHS(CALDTIME, 3), 'Q') FISCAL_QUARTER_NAME
  FROM BIZFLOW.CAL
  ORDER BY CALDTIME DESC;

