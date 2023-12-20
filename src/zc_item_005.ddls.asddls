@EndUserText.label: 'ZC_ITEM_005'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['MatrixUUID','ItemID','ItemID2'] // Bold Font (side effect: Set as Primary Key)
define view entity ZC_ITEM_005 as projection on ZI_ITEM_005 as Item
{
    key MatrixUUID,
    key ItemID,
    ItemID2,
    Model,
    Color,
    Cupsize,
    Backsize,
    Product,
    Quantity,
    Stock,   
    AvailableStock,
    Availability,
    ProductURL,
    Criticality01,
    Createdby,
    Createdat,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Matrix : redirected to parent ZC_MATRIX_005
}
