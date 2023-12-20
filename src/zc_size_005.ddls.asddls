@EndUserText.label: 'ZC_SIZE_005'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
//@ObjectModel.semanticKey: ['Back'] // Bold Font (side effect: Set as Primary Key)
define view entity ZC_SIZE_005 as projection on ZI_SIZE_005 as Size
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
