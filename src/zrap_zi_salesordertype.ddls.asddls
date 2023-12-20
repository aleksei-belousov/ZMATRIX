/********** GENERATED on 09/13/2023 at 08:52:30 by CB9980000024**************/
 @OData.entitySet.name: 'ZI_SalesOrderType' 
 @OData.entityType.name: 'ZI_SalesOrderTypeType' 
 define root abstract entity ZRAP_ZI_SALESORDERTYPE { 
 key SalesOrderType : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'Description_vc' 
 Description : abap.char( 20 ) ; 
 Description_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 ETAG__ETAG : abap.string( 0 ) ; 
 
 } 
