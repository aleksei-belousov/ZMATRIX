@EndUserText.label: 'Matrix Type'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_MATRIXTYPE_005 provider contract transactional_query as projection on ZI_MATRIXTYPE_005 as MatrixType
{
    key MatrixTypeUUID,
    MatrixTypeID,
    Description,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
//    _TypeSize : redirected to composition child ZC_TYPESIZE_005,
    _BackSize : redirected to composition child ZC_BACKSIZE_005,
    _CupSize : redirected to composition child ZC_CUPSIZE_005
}
