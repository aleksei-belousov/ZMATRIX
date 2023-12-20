@EndUserText.label: 'Model'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_MODEL_005 provider contract transactional_query as projection on ZI_MODEL_005 as Model
{
    key ModelUUID,
    ModelID,
    Description,
    @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_MATRIXTYPE_005', element: 'MatrixTypeID' } } ]
    MatrixTypeID,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
}
