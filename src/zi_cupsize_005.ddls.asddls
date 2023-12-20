@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_CUPSIZE_005'
define view entity ZI_CUPSIZE_005 as select from zcupsize_005 as Cupsize
association to parent ZI_MATRIXTYPE_005 as _MatrixType on $projection.MatrixTypeUUID = _MatrixType.MatrixTypeUUID
{
    key cupsizeuuid as CupSizeUUID,
    matrixtypeuuid as MatrixTypeUUID,
    cupsizeid as CupSizeID,
    description as Description,
    sort as Sort,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
    _MatrixType // Make association public

}
