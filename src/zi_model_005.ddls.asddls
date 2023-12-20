@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Model'
define root view entity ZI_MODEL_005 as select from zmodel_005 as Model
{
    key modeluuid as ModelUUID,
    modelid as ModelID,
    description as Description,
    matrixtypeid as MatrixTypeID,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt
}
