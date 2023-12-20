@EndUserText.label: 'Matrix'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
//@ObjectModel.semanticKey: ['Model'] // Bold Font (side effect: Set as Primary Key)
define root view entity ZC_MATRIX_005 provider contract transactional_query as projection on ZI_MATRIX_005 as Matrix
{
    key MatrixUUID,
    @EndUserText.label: 'Matrix ID'
    MatrixID,

    @EndUserText.label: 'Sales Order ID'
    SalesOrderID,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_SalesOrderType', element: 'SalesOrderType' }, useForValidation: true } ]
    @ObjectModel.foreignKey.association: '_SalesOrderType'
    @EndUserText.label: 'Sales Order Type'
    SalesOrderType,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'I_SalesOrganization', element: 'SalesOrganization' }, useForValidation: true } ]
    @ObjectModel.foreignKey.association: '_SalesOrganization'
    @EndUserText.label: 'Sales Organization'
    SalesOrganization,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_DistributionChannel', element: 'DistributionChannel' }, useForValidation: true } ]
    @ObjectModel.foreignKey.association: '_DistributionChannel'
    @EndUserText.label: 'Distribution Channel'
    DistributionChannel,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Division', element: 'Division' }, useForValidation: true } ]
    @ObjectModel.foreignKey.association: '_OrganizationDivision'
    @EndUserText.label: 'Organization Division'
    OrganizationDivision,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Customer', element: 'Customer' }, useForValidation: true } ]
    @ObjectModel.foreignKey.association: '_Customer'
    @EndUserText.label: 'Sold To Party'
    @ObjectModel.text.element: ['CustomerName']
    SoldToParty,
    _Customer.CustomerName as CustomerName,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_MODEL_005', element: 'ModelID' } } ]
    @EndUserText.label: 'Model'
    Model,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_COLOR_005', element: 'ColorID' } } ]
    @EndUserText.label: 'Color'
    Color,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_MATRIXTYPE_005', element: 'MatrixTypeID' } } ]
    @EndUserText.label: 'Matrix Type ID'
    MatrixTypeID,

    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_COUNTRY_005', element: 'CountryID' } } ]
    @EndUserText.label: 'Country'
    Country,

    @EndUserText.label: 'Customer Reference'
    PurchaseOrderByCustomer,

    @EndUserText.label: 'Requested Delivery Date'
    RequestedDeliveryDate,

    @EndUserText.label: 'Copy Color'
    Copying,

    @EndUserText.label: 'Model Maintenance'
    ModelRef,

    @EndUserText.label: 'Color Maintenance'
    ColorRef,

    @EndUserText.label: 'Country Maintenance'
    CountryRef,

    @EndUserText.label: 'Matrix Type Maintenance'
    MatrixTypeRef,

    CreationDate,
    CreationTime,
    SalesOrderURL,
    CustomerURL,
    ModelRefURL,
    ColorRefURL,
    CountryRefURL,
    MatrixTypeRefURL,
    Hidden00,
    Hidden01,
    Hidden02,
    Hidden03,
    Hidden04,
    Hidden05,
    Hidden06,
    Hidden07,
    Hidden08,
    Hidden09,
    Hidden10,
    Hidden11,
    Hidden12,
    Hidden13,
    Hidden14,
    Hidden15,
    Hidden16,
    Hidden17,
    Hidden18,
    Hidden19,
    Hidden20,
    Hidden21,
    Hidden22,
    Criticality01,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Sizehead: redirected to composition child ZC_SIZEHEAD_005,
    _Size: redirected to composition child ZC_SIZE_005,
    _Item: redirected to composition child ZC_ITEM_005,
    _SalesOrderType,
    _SalesOrganization,
    _DistributionChannel,
    _OrganizationDivision,
    _Customer

}
