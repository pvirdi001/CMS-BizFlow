CREATE OR REPLACE VIEW VW_ERLR_GEN
AS
SELECT
    EG.ERLR_CASE_NUMBER
    , EC.ERLR_JOB_REQ_NUMBER
    , EC.PROCID    
    , EC.ERLR_CASE_CREATE_DT
	, (SELECT M.NAME FROM BIZFLOW.MEMBER M WHERE M.MEMBERID = EG.GEN_PRIMARY_SPECIALIST AND ROWNUM = 1)  AS GEN_PRIMARY_SPECIALIST_NAME	
	, (SELECT M.NAME FROM BIZFLOW.MEMBER M WHERE M.MEMBERID = EG.GEN_SECONDARY_SPECIALIST AND ROWNUM = 1)  AS GEN_SECONDARY_SPECIALIST_NAME
	, EG.GEN_CUSTOMER_NAME
	, EG.GEN_CUSTOMER_PHONE
	, EG.GEN_CUSTOMER_ADMIN_CD
	, EG.GEN_CUSTOMER_ADMIN_CD_DESC
	, EG.GEN_EMPLOYEE_NAME
	, EG.GEN_EMPLOYEE_PHONE
	, EG.GEN_EMPLOYEE_ADMIN_CD
	, EG.GEN_EMPLOYEE_ADMIN_CD_DESC
	, EG.GEN_CASE_DESC
	, (SELECT L.TBL_LABEL FROM TBL_LOOKUP L WHERE L.TBL_ID = EG.GEN_CASE_STATUS AND ROWNUM = 1) AS GEN_CASE_STATUS
	, EG.GEN_CUST_INIT_CONTACT_DT
	, EG.GEN_PRIMARY_REP_AFFILIATION
	, (SELECT M.NAME FROM BIZFLOW.MEMBER M WHERE M.MEMBERID = EG.GEN_CMS_PRIMARY_REP_ID AND ROWNUM = 1) AS GEN_CMS_PRIMARY_REP_ID
	, EG.GEN_CMS_PRIMARY_REP_PHONE
	, EG.GEN_NON_CMS_PRIMARY_FNAME
	, EG.GEN_NON_CMS_PRIMARY_MNAME
	, EG.GEN_NON_CMS_PRIMARY_LNAME
	, EG.GEN_NON_CMS_PRIMARY_EMAIL
	, EG.GEN_NON_CMS_PRIMARY_PHONE
	, EG.GEN_NON_CMS_PRIMARY_ORG
	, EG.GEN_NON_CMS_PRIMARY_ADDR
	, (SELECT L.TBL_LABEL FROM TBL_LOOKUP L WHERE L.TBL_ID = EG.GEN_CASE_TYPE AND ROWNUM = 1) AS GEN_CASE_TYPE
	, FN_GET_CASE_CATEGORY(EG.GEN_CASE_CATEGORY) AS GEN_CASE_CATEGORY
	, EG.GEN_INVESTIGATION
	, EG.GEN_INVESTIGATE_START_DT
	, EG.GEN_INVESTIGATE_END_DT
	, EG.GEN_STD_CONDUCT
	, GEN_STD_CONDUCT_TYPE
	, CC_FINAL_ACTION
	, EG.CC_CASE_COMPLETE_DT	
FROM
	ERLR_GEN EG
    LEFT OUTER JOIN ERLR_CASE EC ON EG.ERLR_CASE_NUMBER = EC.ERLR_CASE_NUMBER
;
/

GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GEN TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GEN TO HHS_CMS_HR_DEV_ROLE;