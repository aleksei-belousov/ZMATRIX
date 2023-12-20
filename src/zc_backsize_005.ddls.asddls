@EndUserText.label: 'Backsize'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BACKSIZE_005 as projection on ZI_BACKSIZE_005 as Backsize
{
    key BackSizeUUID,
    MatrixTypeUUID,
    BackSizeID,
    Description,
    BackSizeFR,
    BackSizeUS,
    BackSizeGB,
    Sort,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _MatrixType : redirected to parent ZC_MATRIXTYPE_005
}
