/********** GENERATED on 09/13/2023 at 08:53:02 by CB9980000024**************/
 @OData.entitySet.name: 'ZC_MATRIX_005' 
 @OData.entityType.name: 'ZC_MATRIX_005Type' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZRAP_ZC_MATRIX_005 { 
 key MatrixUUID : sysuuid_x16 ; 
 key IsActiveEntity : abap_boolean ; 
 @OData.property.valueControl: 'MatrixID_vc' 
 MatrixID : abap.numc( 10 ) ; 
 MatrixID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrderType_vc' 
 SalesOrderType : abap.char( 4 ) ; 
 SalesOrderType_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrganization_vc' 
 SalesOrganization : abap.char( 4 ) ; 
 SalesOrganization_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DistributionChannel_vc' 
 DistributionChannel : abap.char( 2 ) ; 
 DistributionChannel_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'OrganizationDivision_vc' 
 OrganizationDivision : abap.char( 2 ) ; 
 OrganizationDivision_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SoldToParty_vc' 
 SoldToParty : abap.char( 10 ) ; 
 SoldToParty_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CustomerName_vc' 
 CustomerName : abap.char( 80 ) ; 
 CustomerName_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Model_vc' 
 Model : abap.char( 10 ) ; 
 Model_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Color_vc' 
 Color : abap.char( 10 ) ; 
 Color_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MatrixTypeID_vc' 
 MatrixTypeID : abap.char( 20 ) ; 
 MatrixTypeID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Country_vc' 
 Country : abap.char( 2 ) ; 
 Country_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'PurchaseOrderByCustomer_vc' 
 PurchaseOrderByCustomer : abap.char( 35 ) ; 
 PurchaseOrderByCustomer_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'RequestedDeliveryDate_vc' 
 RequestedDeliveryDate : abap.dats; 
 RequestedDeliveryDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Copying_vc' 
 Copying : abap_boolean ; 
 Copying_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreationDate_vc' 
 CreationDate : rap_cp_odata_v2_edm_datetime ; 
 CreationDate_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreationTime_vc' 
 CreationTime : rap_cp_odata_v2_edm_time ; 
 CreationTime_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrderID_vc' 
 SalesOrderID : abap.char( 10 ) ; 
 SalesOrderID_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'SalesOrderURL_vc' 
 SalesOrderURL : abap.char( 200 ) ; 
 SalesOrderURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CustomerURL_vc' 
 CustomerURL : abap.char( 200 ) ; 
 CustomerURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ModelRef_vc' 
 ModelRef : abap.char( 30 ) ; 
 ModelRef_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ModelRefURL_vc' 
 ModelRefURL : abap.char( 400 ) ; 
 ModelRefURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ColorRef_vc' 
 ColorRef : abap.char( 30 ) ; 
 ColorRef_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'ColorRefURL_vc' 
 ColorRefURL : abap.char( 400 ) ; 
 ColorRefURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CountryRef_vc' 
 CountryRef : abap.char( 30 ) ; 
 CountryRef_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CountryRefURL_vc' 
 CountryRefURL : abap.char( 400 ) ; 
 CountryRefURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MatrixTypeRef_vc' 
 MatrixTypeRef : abap.char( 30 ) ; 
 MatrixTypeRef_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'MatrixTypeRefURL_vc' 
 MatrixTypeRefURL : abap.char( 400 ) ; 
 MatrixTypeRefURL_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden00_vc' 
 Hidden00 : abap_boolean ; 
 Hidden00_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden01_vc' 
 Hidden01 : abap_boolean ; 
 Hidden01_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden02_vc' 
 Hidden02 : abap_boolean ; 
 Hidden02_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden03_vc' 
 Hidden03 : abap_boolean ; 
 Hidden03_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden04_vc' 
 Hidden04 : abap_boolean ; 
 Hidden04_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden05_vc' 
 Hidden05 : abap_boolean ; 
 Hidden05_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden06_vc' 
 Hidden06 : abap_boolean ; 
 Hidden06_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden07_vc' 
 Hidden07 : abap_boolean ; 
 Hidden07_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden08_vc' 
 Hidden08 : abap_boolean ; 
 Hidden08_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden09_vc' 
 Hidden09 : abap_boolean ; 
 Hidden09_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden10_vc' 
 Hidden10 : abap_boolean ; 
 Hidden10_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden11_vc' 
 Hidden11 : abap_boolean ; 
 Hidden11_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden12_vc' 
 Hidden12 : abap_boolean ; 
 Hidden12_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden13_vc' 
 Hidden13 : abap_boolean ; 
 Hidden13_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden14_vc' 
 Hidden14 : abap_boolean ; 
 Hidden14_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden15_vc' 
 Hidden15 : abap_boolean ; 
 Hidden15_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden16_vc' 
 Hidden16 : abap_boolean ; 
 Hidden16_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden17_vc' 
 Hidden17 : abap_boolean ; 
 Hidden17_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden18_vc' 
 Hidden18 : abap_boolean ; 
 Hidden18_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden19_vc' 
 Hidden19 : abap_boolean ; 
 Hidden19_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden20_vc' 
 Hidden20 : abap_boolean ; 
 Hidden20_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden21_vc' 
 Hidden21 : abap_boolean ; 
 Hidden21_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Hidden22_vc' 
 Hidden22 : abap_boolean ; 
 Hidden22_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'Criticality01_vc' 
 Criticality01 : abap.char( 1 ) ; 
 Criticality01_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreatedBy_vc' 
 CreatedBy : abap.char( 12 ) ; 
 CreatedBy_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'CreatedAt_vc' 
 CreatedAt : tzntstmpl ; 
 CreatedAt_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'LastChangedBy_vc' 
 LastChangedBy : abap.char( 12 ) ; 
 LastChangedBy_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'LastChangedAt_vc' 
 LastChangedAt : tzntstmpl ; 
 LastChangedAt_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'LocalLastChangedAt_vc' 
 LocalLastChangedAt : tzntstmpl ; 
 LocalLastChangedAt_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'HasDraftEntity_vc' 
 HasDraftEntity : abap_boolean ; 
 HasDraftEntity_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DraftEntityCreationDateTime_vc' 
 DraftEntityCreationDateTime : tzntstmpl ; 
 DraftEntityCreationDateTime_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'DraftEntityLastChangeDateTi_vc' 
 DraftEntityLastChangeDateTime : tzntstmpl ; 
 DraftEntityLastChangeDateTi_vc : rap_cp_odata_value_control ; 
 @OData.property.valueControl: 'HasActiveEntity_vc' 
 HasActiveEntity : abap_boolean ; 
 HasActiveEntity_vc : rap_cp_odata_value_control ; 
 ETAG__ETAG : abap.string( 0 ) ; 
 
 @OData.property.name: 'DraftAdministrativeData' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _DraftAdministrativeData1 : association [1] to ZRAP_I_DRAFTADMINISTRATIVEDATA on 1 = 1; 
 @OData.property.name: 'to_Customer' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Customer : association [1] to ZRAP_I_CUSTOMER on 1 = 1; 
 @OData.property.name: 'to_Item' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Item : association [0..*] to ZRAP_ZC_ITEM_005 on 1 = 1; 
 @OData.property.name: 'to_Size' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Size : association [0..*] to ZRAP_ZC_SIZE_005 on 1 = 1; 
 @OData.property.name: 'to_Sizehead' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Sizehead : association [0..*] to ZRAP_ZC_SIZEHEAD_005 on 1 = 1; 
 } 
