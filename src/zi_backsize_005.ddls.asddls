@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Backsize'
define view entity ZI_BACKSIZE_005 as select from zbacksize_005 as BackSize
association to parent ZI_MATRIXTYPE_005 as _MatrixType on $projection.MatrixTypeUUID = _MatrixType.MatrixTypeUUID
{
    key backsizeuuid as BackSizeUUID,
    matrixtypeuuid as MatrixTypeUUID,
    backsizeid as BackSizeID,
    description as Description,
    backsizefr as BackSizeFR,
    backsizeus as BackSizeUS,
    backsizegb as BackSizeGB,
    sort as Sort,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
    _MatrixType // Make association public
}
