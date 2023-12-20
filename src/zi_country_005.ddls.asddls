@EndUserText.label: 'Country'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_COUNTRY_005 as select from zcountry_005 as Country
{
    key countryuuid as CountryUUID,
    countryid as CountryID,
    description as Description,
    createdby as CreatedBy,
    createdat as CreatedAt,
    lastchangedby as LastChangedBy,
    lastchangedat as LastChangedAt,
    locallastchangedat as LocalLastChangedAt
}
