@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Matrix'
define root view entity ZI_MATRIX_005 as select from zmatrix_005 as Matrix
composition [0..*] of ZI_SIZEHEAD_005 as _Sizehead
composition [0..*] of ZI_SIZE_005 as _Size
composition [0..*] of ZI_ITEM_005 as _Item
association [0..1] to ZI_SalesOrderType as _SalesOrderType on $projection.SalesOrderType = _SalesOrderType.SalesOrderType
association [0..1] to I_SalesOrganization as _SalesOrganization on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
association [0..1] to ZI_DistributionChannel as _DistributionChannel on $projection.DistributionChannel = _DistributionChannel.DistributionChannel
association [0..1] to I_Division as _OrganizationDivision on $projection.OrganizationDivision = _OrganizationDivision.Division
association [0..1] to I_Customer as _Customer on $projection.SoldToParty = _Customer.Customer

{
    key matrixuuid as MatrixUUID,
    matrixid as MatrixID,
    salesordertype as SalesOrderType,
    salesorganization as SalesOrganization,
    distributionchannel as DistributionChannel,
    organizationdivision as OrganizationDivision,
    soldtoparty as SoldToParty,
    model as Model,
    color as Color,
    matrixtypeid as MatrixTypeID,
    country as Country,
    purchaseorderbycustomer as PurchaseOrderByCustomer,
    requesteddeliverydate as RequestedDeliveryDate,
    copying as Copying,
    creationdate as CreationDate,
    creationtime as CreationTime,
    salesorderid as SalesOrderID,
    salesorderurl as SalesOrderURL,
    customerurl as CustomerURL,
    modelref as ModelRef,
    modelrefurl as ModelRefURL,
    colorref as ColorRef,
    colorrefurl as ColorRefURL,
    countryref as CountryRef,
    countryrefurl as CountryRefURL,
    matrixtyperef as MatrixTypeRef,
    matrixtyperefurl as MatrixTypeRefURL,
    hidden00 as Hidden00,
    hidden01 as Hidden01,
    hidden02 as Hidden02,
    hidden03 as Hidden03,
    hidden04 as Hidden04,
    hidden05 as Hidden05,
    hidden06 as Hidden06,
    hidden07 as Hidden07,
    hidden08 as Hidden08,
    hidden09 as Hidden09,
    hidden10 as Hidden10,
    hidden11 as Hidden11,
    hidden12 as Hidden12,
    hidden13 as Hidden13,
    hidden14 as Hidden14,
    hidden15 as Hidden15,
    hidden16 as Hidden16,
    hidden17 as Hidden17,
    hidden18 as Hidden18,
    hidden19 as Hidden19,
    hidden20 as Hidden20,
    hidden21 as Hidden21,
    hidden22 as Hidden22,
    criticality01 as Criticality01,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
    _Sizehead, // Make association public
    _Size, // Make association public
    _Item, // Make association public
    _SalesOrderType, // Make association public
    _SalesOrganization, // Make association public
    _DistributionChannel, // Make association public
    _OrganizationDivision, // Make association public
    _Customer // Make association public
}
