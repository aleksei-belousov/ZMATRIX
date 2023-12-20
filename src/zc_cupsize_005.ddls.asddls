@EndUserText.label: 'Cupsize'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_CUPSIZE_005 as projection on ZI_CUPSIZE_005 as Cupsize
{
    key CupSizeUUID,
    MatrixTypeUUID,
    CupSizeID,
    Description,
    Sort,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _MatrixType : redirected to parent ZC_MATRIXTYPE_005

}
