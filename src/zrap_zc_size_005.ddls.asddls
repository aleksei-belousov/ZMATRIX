/********** GENERATED on 09/13/2023 at 08:53:08 by CB9980000024**************/
 @OData.entitySet.name: 'ZC_SIZE_005' 
 @OData.entityType.name: 'ZC_SIZE_005Type' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZRAP_ZC_SIZE_005 { 
 key MatrixUUID : sysuuid_x16 ; 
 key SizeID : abap.numc( 10 ) ; 
 key IsActiveEntity : abap_boolean ; 
 @Odata.property.valueControl: 'Back_vc' 
 Back : abap.char( 20 ) ; 
 Back_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'A_vc' 
 A : abap.char( 10 ) ; 
 A_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'B_vc' 
 B : abap.char( 10 ) ; 
 B_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'C1_vc' 
 @OData.property.name: 'C' 
 C1 : abap.char( 10 ) ; 
 C1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'D_vc' 
 D : abap.char( 10 ) ; 
 D_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'E_vc' 
 E : abap.char( 10 ) ; 
 E_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'F_vc' 
 F : abap.char( 10 ) ; 
 F_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'G_vc' 
 G : abap.char( 10 ) ; 
 G_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'H_vc' 
 H : abap.char( 10 ) ; 
 H_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'I_vc' 
 I : abap.char( 10 ) ; 
 I_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'J_vc' 
 J : abap.char( 10 ) ; 
 J_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'K_vc' 
 K : abap.char( 10 ) ; 
 K_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'L_vc' 
 L : abap.char( 10 ) ; 
 L_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BackSizeID_vc' 
 BackSizeID : abap.char( 20 ) ; 
 BackSizeID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedBy_vc' 
 CreatedBy : abap.char( 12 ) ; 
 CreatedBy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedAt_vc' 
 CreatedAt : tzntstmpl ; 
 CreatedAt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
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
 _DraftAdministrativeData123 : association [1] to ZRAP_I_DRAFTADMINISTRATIVEDATA on 1 = 1; 
 @OData.property.name: 'to_Matrix' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Matrix12 : association [1] to ZRAP_ZC_MATRIX_005 on 1 = 1; 
 } 
