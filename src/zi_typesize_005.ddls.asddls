@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Type Size'
define root view entity ZI_TYPESIZE_005 as select from ztypesize_005 as TypeSize
//association to parent ZI_MATRIXTYPE_005 as _MatrixType on $projection.MatrixTypeUUID = _MatrixType.MatrixTypeUUID
{
    key typesizeuuid as TypeSizeUUID,
    key matrixtypeuuid as MatrixTypeUUID,
    back as Back,
    a as A,
    b as B,
    c as C,
    d as D,
    e as E,
    f as F,
    g as G,
    h as H,
    i as I,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt
//    _MatrixType // Make association public
}
