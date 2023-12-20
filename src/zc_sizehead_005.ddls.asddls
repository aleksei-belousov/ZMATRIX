@EndUserText.label: 'ZC_SIZEHEAD_005'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_SIZEHEAD_005 as projection on ZI_SIZEHEAD_005 as Sizehead
{
    key MatrixUUID,
    key SizeID,
    Back,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    BackSizeID,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Matrix : redirected to parent ZC_MATRIX_005
}
