@EndUserText.label: 'Country'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_COUNTRY_005 provider contract transactional_query as projection on ZI_COUNTRY_005
{
    key CountryUUID,
    CountryID,
    Description,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
}
