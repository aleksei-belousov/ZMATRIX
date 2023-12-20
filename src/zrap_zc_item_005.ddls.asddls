/********** GENERATED on 09/13/2023 at 08:52:58 by CB9980000024**************/
 @OData.entitySet.name: 'ZC_ITEM_005' 
 @OData.entityType.name: 'ZC_ITEM_005Type' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZRAP_ZC_ITEM_005 { 
 key MatrixUUID : sysuuid_x16 ; 
 key ItemID : abap.numc( 10 ) ; 
 key IsActiveEntity : abap_boolean ; 
 @Odata.property.valueControl: 'ItemID2_vc' 
 ItemID2 : abap.numc( 10 ) ; 
 ItemID2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Model_vc' 
 Model : abap.char( 10 ) ; 
 Model_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Color_vc' 
 Color : abap.char( 10 ) ; 
 Color_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Cupsize_vc' 
 Cupsize : abap.char( 10 ) ; 
 Cupsize_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Backsize_vc' 
 Backsize : abap.char( 10 ) ; 
 Backsize_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Product_vc' 
 Product : abap.char( 40 ) ; 
 Product_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Quantity_vc' 
 Quantity : abap.char( 10 ) ; 
 Quantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Stock_vc' 
 Stock : abap.char( 10 ) ; 
 Stock_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AvailableStock_vc' 
 AvailableStock : abap.char( 10 ) ; 
 AvailableStock_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Availability_vc' 
 Availability : abap.char( 40 ) ; 
 Availability_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductURL_vc' 
 ProductURL : abap.char( 200 ) ; 
 ProductURL_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Criticality01_vc' 
 Criticality01 : abap.char( 1 ) ; 
 Criticality01_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Createdby_vc' 
 Createdby : abap.char( 12 ) ; 
 Createdby_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Createdat_vc' 
 Createdat : tzntstmpl ; 
 Createdat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedBy_vc' 
 LastChangedBy : abap.char( 12 ) ; 
 LastChangedBy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedAt_vc' 
 LastChangedAt : tzntstmpl ; 
 LastChangedAt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LocalLastChangedAt_vc' 
 LocalLastChangedAt : tzntstmpl ; 
 LocalLastChangedAt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasDraftEntity_vc' 
 HasDraftEntity : abap_boolean ; 
 HasDraftEntity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DraftEntityCreationDateTime_vc' 
 DraftEntityCreationDateTime : tzntstmpl ; 
 DraftEntityCreationDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DraftEntityLastChangeDateTi_vc' 
 DraftEntityLastChangeDateTime : tzntstmpl ; 
 DraftEntityLastChangeDateTi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasActiveEntity_vc' 
 HasActiveEntity : abap_boolean ; 
 HasActiveEntity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 ETAG__ETAG : abap.string( 0 ) ; 
 
 @OData.property.name: 'DraftAdministrativeData' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _DraftAdministrativeData : association [1] to ZRAP_I_DRAFTADMINISTRATIVEDATA on 1 = 1; 
 @OData.property.name: 'to_Matrix' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Matrix : association [1] to ZRAP_ZC_MATRIX_005 on 1 = 1; 
 } 
