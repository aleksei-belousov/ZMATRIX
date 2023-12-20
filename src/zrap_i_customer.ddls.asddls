/********** GENERATED on 09/13/2023 at 08:52:24 by CB9980000024**************/
 @OData.entitySet.name: 'I_Customer' 
 @OData.entityType.name: 'I_CustomerType' 
 define root abstract entity ZRAP_I_CUSTOMER { 
 key Customer : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'CustomerName_vc' 
 CustomerName : abap.char( 80 ) ; 
 CustomerName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerFullName_vc' 
 CustomerFullName : abap.char( 220 ) ; 
 CustomerFullName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPCustomerName_vc' 
 BPCustomerName : abap.char( 81 ) ; 
 BPCustomerName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPCustomerFullName_vc' 
 BPCustomerFullName : abap.char( 220 ) ; 
 BPCustomerFullName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDate_vc' 
 CreationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressID_vc' 
 AddressID : abap.char( 10 ) ; 
 AddressID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerClassification_vc' 
 CustomerClassification : abap.char( 2 ) ; 
 CustomerClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerClassification_Text_vc' 
 CustomerClassification_Text : abap.char( 20 ) ; 
 CustomerClassification_Text_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VATRegistration_vc' 
 VATRegistration : abap.char( 20 ) ; 
 VATRegistration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerAccountGroup_vc' 
 CustomerAccountGroup : abap.char( 4 ) ; 
 CustomerAccountGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationGroup_vc' 
 AuthorizationGroup : abap.char( 4 ) ; 
 AuthorizationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryIsBlocked_vc' 
 DeliveryIsBlocked : abap.char( 2 ) ; 
 DeliveryIsBlocked_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PostingIsBlocked_vc' 
 PostingIsBlocked : abap_boolean ; 
 PostingIsBlocked_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BillingIsBlockedForCustomer_vc' 
 BillingIsBlockedForCustomer : abap.char( 2 ) ; 
 BillingIsBlockedForCustomer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderIsBlockedForCustomer_vc' 
 OrderIsBlockedForCustomer : abap.char( 2 ) ; 
 OrderIsBlockedForCustomer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalLocationNumber_vc' 
 InternationalLocationNumber1 : abap.numc( 7 ) ; 
 InternationalLocationNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsOneTimeAccount_vc' 
 IsOneTimeAccount : abap_boolean ; 
 IsOneTimeAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxJurisdiction_vc' 
 TaxJurisdiction : abap.char( 15 ) ; 
 TaxJurisdiction_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Industry_vc' 
 Industry : abap.char( 4 ) ; 
 Industry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumberType_vc' 
 TaxNumberType : abap.char( 2 ) ; 
 TaxNumberType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber1_vc' 
 TaxNumber1 : abap.char( 16 ) ; 
 TaxNumber1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber2_vc' 
 TaxNumber2 : abap.char( 11 ) ; 
 TaxNumber2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber3_vc' 
 TaxNumber3 : abap.char( 18 ) ; 
 TaxNumber3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber4_vc' 
 TaxNumber4 : abap.char( 18 ) ; 
 TaxNumber4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber5_vc' 
 TaxNumber5 : abap.char( 60 ) ; 
 TaxNumber5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxNumber6_vc' 
 TaxNumber6 : abap.char( 20 ) ; 
 TaxNumber6_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerCorporateGroup_vc' 
 CustomerCorporateGroup : abap.char( 10 ) ; 
 CustomerCorporateGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Supplier_vc' 
 Supplier : abap.char( 10 ) ; 
 Supplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NielsenRegion_vc' 
 NielsenRegion : abap.char( 2 ) ; 
 NielsenRegion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryCode1_vc' 
 IndustryCode1 : abap.char( 10 ) ; 
 IndustryCode1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryCode2_vc' 
 IndustryCode2 : abap.char( 10 ) ; 
 IndustryCode2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryCode3_vc' 
 IndustryCode3 : abap.char( 10 ) ; 
 IndustryCode3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryCode4_vc' 
 IndustryCode4 : abap.char( 10 ) ; 
 IndustryCode4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryCode5_vc' 
 IndustryCode5 : abap.char( 10 ) ; 
 IndustryCode5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Country_vc' 
 Country : abap.char( 3 ) ; 
 Country_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrganizationBPName1_vc' 
 OrganizationBPName1 : abap.char( 35 ) ; 
 OrganizationBPName1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrganizationBPName2_vc' 
 OrganizationBPName2 : abap.char( 35 ) ; 
 OrganizationBPName2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CityName_vc' 
 CityName : abap.char( 35 ) ; 
 CityName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PostalCode_vc' 
 PostalCode : abap.char( 10 ) ; 
 PostalCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StreetName_vc' 
 StreetName : abap.char( 35 ) ; 
 StreetName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SortField_vc' 
 SortField : abap.char( 10 ) ; 
 SortField_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FaxNumber_vc' 
 FaxNumber : abap.char( 31 ) ; 
 FaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BR_SUFRAMACode_vc' 
 BR_SUFRAMACode : abap.char( 9 ) ; 
 BR_SUFRAMACode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Region_vc' 
 Region : abap.char( 3 ) ; 
 Region_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TelephoneNumber1_vc' 
 TelephoneNumber1 : abap.char( 16 ) ; 
 TelephoneNumber1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TelephoneNumber2_vc' 
 TelephoneNumber2 : abap.char( 16 ) ; 
 TelephoneNumber2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AlternativePayerAccount_vc' 
 AlternativePayerAccount : abap.char( 10 ) ; 
 AlternativePayerAccount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataMediumExchangeIndicator_vc' 
 DataMediumExchangeIndicator : abap.char( 1 ) ; 
 DataMediumExchangeIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VATLiability_vc' 
 VATLiability : abap_boolean ; 
 VATLiability_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsBusinessPurposeCompleted_vc' 
 IsBusinessPurposeCompleted : abap.char( 1 ) ; 
 IsBusinessPurposeCompleted_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ResponsibleType_vc' 
 ResponsibleType : abap.char( 2 ) ; 
 ResponsibleType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalAddress_vc' 
 FiscalAddress : abap.char( 10 ) ; 
 FiscalAddress_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NFPartnerIsNaturalPerson_vc' 
 NFPartnerIsNaturalPerson : abap.char( 1 ) ; 
 NFPartnerIsNaturalPerson_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeletionIndicator_vc' 
 DeletionIndicator : abap_boolean ; 
 DeletionIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Language_vc' 
 Language : abap.char( 2 ) ; 
 Language_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TradingPartner_vc' 
 TradingPartner : abap.char( 6 ) ; 
 TradingPartner_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryDateTypeRule_vc' 
 DeliveryDateTypeRule : abap.char( 1 ) ; 
 DeliveryDateTypeRule_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExpressTrainStationName_vc' 
 ExpressTrainStationName : abap.char( 25 ) ; 
 ExpressTrainStationName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TrainStationName_vc' 
 TrainStationName : abap.char( 25 ) ; 
 TrainStationName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalLocationNumber_v1' 
 InternationalLocationNumber2 : abap.numc( 5 ) ; 
 InternationalLocationNumber_v1 : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalLocationNumber_v2' 
 InternationalLocationNumber3 : abap.numc( 1 ) ; 
 InternationalLocationNumber_v2 : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CityCode_vc' 
 CityCode : abap.char( 4 ) ; 
 CityCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'County_vc' 
 County : abap.char( 3 ) ; 
 County_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerHasUnloadingPoint_vc' 
 CustomerHasUnloadingPoint : abap_boolean ; 
 CustomerHasUnloadingPoint_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerWorkingTimeCalendar_vc' 
 CustomerWorkingTimeCalendar : abap.char( 2 ) ; 
 CustomerWorkingTimeCalendar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsCompetitor_vc' 
 IsCompetitor : abap_boolean ; 
 IsCompetitor_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxInvoiceRepresentativeNam_vc' 
 TaxInvoiceRepresentativeName : abap.char( 10 ) ; 
 TaxInvoiceRepresentativeNam_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessType_vc' 
 BusinessType : abap.char( 30 ) ; 
 BusinessType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryType_vc' 
 IndustryType : abap.char( 30 ) ; 
 IndustryType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TW_CollvBillingIsSupported_vc' 
 TW_CollvBillingIsSupported : abap.char( 1 ) ; 
 TW_CollvBillingIsSupported_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AlternativePayeeIsAllowed_vc' 
 AlternativePayeeIsAllowed : abap_boolean ; 
 AlternativePayeeIsAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute01_vc' 
 FreeDefinedAttribute01 : abap.char( 2 ) ; 
 FreeDefinedAttribute01_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute02_vc' 
 FreeDefinedAttribute02 : abap.char( 2 ) ; 
 FreeDefinedAttribute02_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute03_vc' 
 FreeDefinedAttribute03 : abap.char( 2 ) ; 
 FreeDefinedAttribute03_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute04_vc' 
 FreeDefinedAttribute04 : abap.char( 2 ) ; 
 FreeDefinedAttribute04_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute05_vc' 
 FreeDefinedAttribute05 : abap.char( 2 ) ; 
 FreeDefinedAttribute05_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute06_vc' 
 FreeDefinedAttribute06 : abap.char( 3 ) ; 
 FreeDefinedAttribute06_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute07_vc' 
 FreeDefinedAttribute07 : abap.char( 3 ) ; 
 FreeDefinedAttribute07_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute08_vc' 
 FreeDefinedAttribute08 : abap.char( 3 ) ; 
 FreeDefinedAttribute08_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute09_vc' 
 FreeDefinedAttribute09 : abap.char( 3 ) ; 
 FreeDefinedAttribute09_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FreeDefinedAttribute10_vc' 
 FreeDefinedAttribute10 : abap.char( 3 ) ; 
 FreeDefinedAttribute10_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentReason_vc' 
 PaymentReason : abap.char( 4 ) ; 
 PaymentReason_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerConditionGroup1_vc' 
 CustomerConditionGroup1 : abap.char( 2 ) ; 
 CustomerConditionGroup1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerConditionGroup2_vc' 
 CustomerConditionGroup2 : abap.char( 2 ) ; 
 CustomerConditionGroup2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerConditionGroup3_vc' 
 CustomerConditionGroup3 : abap.char( 2 ) ; 
 CustomerConditionGroup3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerConditionGroup4_vc' 
 CustomerConditionGroup4 : abap.char( 2 ) ; 
 CustomerConditionGroup4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustomerConditionGroup5_vc' 
 CustomerConditionGroup5 : abap.char( 2 ) ; 
 CustomerConditionGroup5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsSalesProspect_vc' 
 IsSalesProspect : abap_boolean ; 
 IsSalesProspect_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PaymentIsBlockedForCustomer_vc' 
 PaymentIsBlockedForCustomer : abap_boolean ; 
 PaymentIsBlockedForCustomer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsConsumer_vc' 
 IsConsumer : abap_boolean ; 
 IsConsumer_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataControllerSet_vc' 
 DataControllerSet : abap.char( 1 ) ; 
 DataControllerSet_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController1_vc' 
 DataController1 : abap.char( 30 ) ; 
 DataController1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController2_vc' 
 DataController2 : abap.char( 30 ) ; 
 DataController2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController3_vc' 
 DataController3 : abap.char( 30 ) ; 
 DataController3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController4_vc' 
 DataController4 : abap.char( 30 ) ; 
 DataController4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController5_vc' 
 DataController5 : abap.char( 30 ) ; 
 DataController5_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController6_vc' 
 DataController6 : abap.char( 30 ) ; 
 DataController6_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController7_vc' 
 DataController7 : abap.char( 30 ) ; 
 DataController7_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController8_vc' 
 DataController8 : abap.char( 30 ) ; 
 DataController8_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController9_vc' 
 DataController9 : abap.char( 30 ) ; 
 DataController9_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DataController10_vc' 
 DataController10 : abap.char( 30 ) ; 
 DataController10_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPartnerName1_vc' 
 BusinessPartnerName1 : abap.char( 40 ) ; 
 BusinessPartnerName1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPartnerName2_vc' 
 BusinessPartnerName2 : abap.char( 40 ) ; 
 BusinessPartnerName2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPartnerName3_vc' 
 BusinessPartnerName3 : abap.char( 40 ) ; 
 BusinessPartnerName3_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPartnerName4_vc' 
 BusinessPartnerName4 : abap.char( 40 ) ; 
 BusinessPartnerName4_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPAddrCityName_vc' 
 BPAddrCityName : abap.char( 40 ) ; 
 BPAddrCityName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPAddrStreetName_vc' 
 BPAddrStreetName : abap.char( 60 ) ; 
 BPAddrStreetName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressSearchTerm1_vc' 
 AddressSearchTerm1 : abap.char( 20 ) ; 
 AddressSearchTerm1_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressSearchTerm2_vc' 
 AddressSearchTerm2 : abap.char( 20 ) ; 
 AddressSearchTerm2_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DistrictName_vc' 
 DistrictName : abap.char( 40 ) ; 
 DistrictName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'POBoxDeviatingCityName_vc' 
 POBoxDeviatingCityName : abap.char( 40 ) ; 
 POBoxDeviatingCityName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BusinessPartnerFormOfAddres_vc' 
 BusinessPartnerFormOfAddress : abap.char( 4 ) ; 
 BusinessPartnerFormOfAddres_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 ETAG__ETAG : abap.string( 0 ) ; 
 
 } 
