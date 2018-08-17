# infoscout_map
This is an R shiny application to analyze geographic subsets of a consumer insights panel.  
It is meant to be used by market research clients to verify the demographic representation of panel populations in specific regions.
This is useful for determining locations for product testing which have high coverage on the InfoScout Insights platform.

Each point represents the population density in a zipcode.  
Zooming in/out subsets the data to all samples within the viewing window.  The analytics tab updates in real time to the data subset.
InfoScout panel data is proprietary, so ALL DATA USED IN THIS PROGRAM IS MOCKED FROM OUTDATED PANEL DATA. 
In the professionally used version, data is extracted directly from a SQL database.
