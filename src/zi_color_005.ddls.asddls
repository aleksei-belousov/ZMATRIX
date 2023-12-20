@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Color'
define root view entity ZI_COLOR_005 as select from zcolor_005 as Color
{
    key coloruuid as ColorUUID,
    colorid as ColorID,
    description as Description,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt
}
