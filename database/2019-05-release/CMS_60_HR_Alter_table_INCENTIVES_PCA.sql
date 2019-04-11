
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD LIC_STATE1_EXP_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD LIC_STATE2_EXP_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_CATEGORY_N NUMBER(20,2);  --$12,000.00, 1000
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_BD_CERT_N NUMBER(20,2);
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_MULTI_YEAR_AGMT_N NUMBER(20,2);
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_MISSION_SC_N NUMBER(20,2);
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_TOTAL_N NUMBER(20,2);
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD ALW_TOTAL_PAYABLE_N NUMBER(20,2);
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_SO_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_DGHO_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_CP_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_OFM_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_TABG_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD RVW_OHC_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD APPROVAL_TABG_DATE_D DATE;
ALTER TABLE HHS_CMS_HR.INCENTIVES_PCA ADD APPROVAL_OADMIN_DATE_D DATE;

UPDATE HHS_CMS_HR.INCENTIVES_PCA
SET LIC_STATE1_EXP_DATE_D = DECODE(LENGTH(LIC_STATE1_EXP_DATE), 10, TO_DATE(LIC_STATE1_EXP_DATE, 'mm/dd/yyyy'), null)
    ,LIC_STATE2_EXP_DATE_D = DECODE(LENGTH(LIC_STATE2_EXP_DATE), 10, TO_DATE(LIC_STATE2_EXP_DATE, 'mm/dd/yyyy'), null)
    ,ALW_CATEGORY_N = regexp_replace(ALW_CATEGORY, '[^0-9|.]', '')
    ,ALW_BD_CERT_N = regexp_replace(ALW_BD_CERT, '[^0-9|.]', '')
    ,ALW_MULTI_YEAR_AGMT_N = regexp_replace(ALW_MULTI_YEAR_AGMT, '[^0-9|.]', '')
    ,ALW_MISSION_SC_N = regexp_replace(ALW_MISSION_SC, '[^0-9|.]', '')
    ,ALW_TOTAL_N = regexp_replace(ALW_TOTAL, '[^0-9|.]', '')
    ,ALW_TOTAL_PAYABLE_N = regexp_replace(ALW_TOTAL_PAYABLE, '[^0-9|.]', '')
    ,RVW_SO_DATE_D = DECODE(LENGTH(RVW_SO_DATE), 10, TO_DATE(RVW_SO_DATE, 'mm/dd/yyyy'), null)
    ,RVW_DGHO_DATE_D = DECODE(LENGTH(RVW_DGHO_DATE), 10, TO_DATE(RVW_DGHO_DATE, 'mm/dd/yyyy'), null)
    ,RVW_CP_DATE_D = DECODE(LENGTH(RVW_CP_DATE), 10, TO_DATE(RVW_CP_DATE, 'mm/dd/yyyy'), null)
    ,RVW_OFM_DATE_D = DECODE(LENGTH(RVW_OFM_DATE), 10, TO_DATE(RVW_OFM_DATE, 'mm/dd/yyyy'), null)
    ,RVW_TABG_DATE_D = DECODE(LENGTH(RVW_TABG_DATE), 10, TO_DATE(RVW_TABG_DATE, 'mm/dd/yyyy'), null)
    ,RVW_OHC_DATE_D = DECODE(LENGTH(RVW_OHC_DATE), 10, TO_DATE(RVW_OHC_DATE, 'mm/dd/yyyy'), null)
    ,APPROVAL_TABG_DATE_D = DECODE(LENGTH(APPROVAL_TABG_DATE), 10, TO_DATE(APPROVAL_TABG_DATE, 'mm/dd/yyyy'), null)
    ,APPROVAL_OADMIN_DATE_D = DECODE(LENGTH(APPROVAL_OADMIN_DATE), 10, TO_DATE(APPROVAL_OADMIN_DATE, 'mm/dd/yyyy'), null);
/


