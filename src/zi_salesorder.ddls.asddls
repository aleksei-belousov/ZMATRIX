@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Type'
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZI_SALESORDER as select from I_SalesOrder
{
    key I_SalesOrder.CreationDate as CreationDate,
    key I_SalesOrder.CreationTime as CreationTime,
    I_SalesOrder.SalesOrder as SalesOrder
}
