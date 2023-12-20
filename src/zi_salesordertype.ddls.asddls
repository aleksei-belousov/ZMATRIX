@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Type'
define view entity ZI_SalesOrderType as select from I_SalesDocumentType join I_SalesDocumentTypeText on
  ( I_SalesDocumentType.SalesDocumentType = I_SalesDocumentTypeText.SalesDocumentType ) and
  ( I_SalesDocumentType.IsLocked = ' ' ) and
  ( I_SalesDocumentTypeText.Language = 'E' ) and
  ( I_SalesDocumentType.SalesDocumentProcessingType != 'P' ) and
  ( ( I_SalesDocumentType.SDDocumentCategory = 'C' ) or
    ( I_SalesDocumentType.SDDocumentCategory = 'H' ) or
    ( I_SalesDocumentType.SDDocumentCategory = 'I' ) or
    ( I_SalesDocumentType.SDDocumentCategory = 'K' ) or
    ( I_SalesDocumentType.SDDocumentCategory = 'L' ) )
{
    key I_SalesDocumentType.SalesDocumentType as SalesOrderType,
    I_SalesDocumentTypeText.SalesDocumentTypeName as Description
}
