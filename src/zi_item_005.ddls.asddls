@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item'
define view entity ZI_ITEM_005 as select from zitem_005 as Item
association to parent ZI_MATRIX_005 as _Matrix on $projection.MatrixUUID = _Matrix.MatrixUUID
{
    key matrixuuid as MatrixUUID,
    key itemid as ItemID,
    itemid2 as ItemID2,
    model as Model,
    color as Color,
    cupsize as Cupsize,
    backsize as Backsize,
    product as Product,
    quantity as Quantity,
    stock as Stock,   
    availablestock as AvailableStock,   
    availability as Availability,
    producturl as ProductURL,
    criticality01 as Criticality01,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt,
    _Matrix
}
