@EndUserText.label: 'Matrix Type Size'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_TYPESIZE_005 provider contract transactional_query as projection on ZI_TYPESIZE_005 as TypeSize
{
    key TypeSizeUUID,
    key MatrixTypeUUID,
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
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
    /* Associations */
//    _MatrixType : redirected to parent ZC_MATRIXTYPE_005
}
