@EndUserText.label: 'Model'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.sqlViewName: 'ZR_MODEL_005A'
@AbapCatalog.compiler.compareFilter: true
define view ZC_MODEL_005A as select from ZI_MODEL_005
{
    @UI.hidden: true
    key ModelUUID,
    
    @EndUserText.label: 'Model ID'
    ModelID,

    @EndUserText.label: 'Description'
    Description
}
