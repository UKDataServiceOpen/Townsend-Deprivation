# Townsend-Deprivation
Townsend Deprivation Scores 1971 to 2011
Deprivation scores created through a summer internship, looking at the feasibility of creating consistent deprivation scores across the UK using Census variables.
Below is an excerp from the report written by the interns. We will include all the source data and script files mentioned in the full report, which will also be added to this repository.

The indicators used to calculate Townsend Deprivation Scores were already defined by Townsend. It was still important however, to determine which census variables best measure each of these indicators.

*Unemployment
This indicator measures the percentage of economically active residents who are unemployed. The census variable that was chosen was economic activity because it was available for all the countries in the UK and provided both aspects of the necessary calculation which are the economically active residents who are unemployed and the total number of economically active residents, aged 16 to 74.
 Consideration was also provided to ‘economic status’ and ‘economic activity of household reference persons’ as potential variables to measure this indicator. Census data for ‘economic status’ was not available for Scotland and previous studies illustrated that this variable was not used.
Census data for ‘economic activity of household reference persons’ was available for the UK but due to complexity with definition, it was not used.
The ‘household reference person’ concept was introduced in 2001 which would create difficulties when making comparisons with previous census data.

*Non-car ownership
Non-car ownership is measured by one census variable that simply asks respondents if they have a car and if they do, how many. This reveals those households that do not have a car.

*Non-home ownership
The tenure variable was the most suitable measure to use for non-home ownership. This measures whether a household rents or owns the accommodation that it occupies.

*Overcrowding
This indicator should measure whether a household is overcrowded, that is, whether the house is suitable in size for the occupants. There are four possible census variables that would be relevant to measure this: Persons per room, Occupancy rating by rooms, Persons per bedroom and Occupancy by bedrooms.
‘Persons per room’ is a measure of how many people are in the house per room, any number over 1 is classed as overcrowded as that would mean there is more than one person per room. 
Occupancy rating’ is a measure of the ages and relationships between people in a household to determine how many rooms they require. 
'Persons per bedroom’ is a new measurement introduced in the 2011 census but is currently only available for England and Wales. It measures how many people are in the house per bedroom rather than all rooms.
‘Occupancy rating by bedroom’ is measured in the same way as occupancy rating but with bedrooms instead of all rooms which like persons per bedroom is currently only available for England and Wales.
For this project, the ‘Person per room’ variable was chosen for two reasons. Firstly, the two variables that measure by bedroom are only available for England and Wales and so these scores wouldn’t be comparable to Scotland and Northern Ireland. Secondly, past research16 has found that measures of occupancy rating are highly skewed which would affect the scores. For these reasons, persons per room was the more suitable measure.

##The Townsend Deprivation Index calculation
The Townsend Deprivation Scores  were calculated using the percentages of the four indicators. These were weighted equally in the calculation. The unemployment and overcrowding indicators were log transformed to normalise the skewed results from these variables. A standard Z score was calculated from each of the indicators.
*Z scores
Creating Z scores standardised each variable so extreme values didn’t affect the Townsend Deprivation score too greatly, further ensuring that each variable was equally weighted. This is because it centred all the scores for each variable around a mean of zero. The Z scores were then added resulting in a Townsend Deprivation score. Due to the Z scores being centred around a mean of zero, any areas with a score above zero were above the mean and therefore deprived whereas areas with scores below zero were more affluent.

The scores in this project were calculated using the 2011 census data across the UK at varying output levels: Local Authority, Ward, LSOA and OA. The data used was published and so can be accessed via InFuse.ukdataservice.ac.uk through the UK Data Service. For 2001, 1991 and 1981, the data was taken from CasWeb.ukdataservice.ac.uk which can also be accessed.
