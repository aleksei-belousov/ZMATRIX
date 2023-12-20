@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Matrix Type'
define root view entity ZI_MATRIXTYPE_005 as select from zmatrixtype_005 as MatrixType
//composition [0..*] of ZI_TYPESIZE_005 as _TypeSize
composition [0..*] of ZI_BACKSIZE_005 as _BackSize
composition [0..*] of ZI_CUPSIZE_005 as _CupSize
{
    key matrixtypeuuid as MatrixTypeUUID,
    matrixtypeid as MatrixTypeID,
    description as Description,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
//    _TypeSize, // Make association public
    _BackSize, // Make association public
    _CupSize // Make association public
}
