@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Distribution Channel'
define view entity ZI_DistributionChannel as select from I_DistributionChannel join I_DistributionChannelText on ( I_DistributionChannel.DistributionChannel = I_DistributionChannelText.DistributionChannel ) and ( I_DistributionChannelText.Language = 'E' )
{
    key I_DistributionChannel.DistributionChannel       as DistributionChannel,
    I_DistributionChannelText.DistributionChannelName   as Name
}
