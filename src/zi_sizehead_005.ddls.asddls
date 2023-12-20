@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sizehead'
define view entity ZI_SIZEHEAD_005 as select from zsizehead_005
association to parent ZI_MATRIX_005 as _Matrix on $projection.MatrixUUID = _Matrix.MatrixUUID 
{
    key matrixuuid as MatrixUUID,
    key sizeid as SizeID,
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
    j as J,
    k as K,
    l as L,
    backsizeid as BackSizeID,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
    _Matrix

}
