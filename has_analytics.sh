#!/bin/sh
PORTALS='
data.colorado.gov            data.nola.gov                healthmeasures.aspe.hhs.gov  data.cityofchicago.org       data.wa.gov                 
opendata.go.ke               data.austintexas.gov         data.cityofnewyork.us        info.samhsa.gov              data.taxpayer.net           
data.cityofmadison.com       data.slcgov.com              data.illinois.gov            data.somervillema.gov        iranhumanrights.socrata.com 
data.hawaii.gov              data.maryland.gov            data.ny.gov                  data.mo.gov                  data.nfpa.org               
nmfs.socrata.com             data.govloop.com             data.sunlightlabs.com        electionsdata.kingcounty.gov data.undp.org               
deleon.socrata.com           data.energystar.gov          explore.data.gov             data.weatherfordtx.gov       bronx.lehman.cuny.edu       
data.sfgov.org               data.edmonton.ca             data.consumerfinance.gov     www.metrochicagodata.org     data.kingcounty.gov         
data.baltimorecity.gov       health.data.ny.gov           dati.lombardia.it            datacatalog.cookcountyil.gov www.opendatanyc.com         
cookcounty.socrata.com       data.oregon.gov              data.oaklandnet.com          data.raleighnc.gov           finances.worldbank.org      
data.honolulu.gov            opendata.socrata.com         data.cityofboston.gov        data.ok.gov                  data.cms.gov                
data.snostat.org             www.halifaxopendata.ca       data.wellingtonfl.gov        gettingpastgo.socrata.com    www.data.act.gov.au         
data.redmond.gov             data.seattle.gov             data.montgomerycountymd.gov  data.acgov.org               data.medicare.gov     
'

mkdir -p analytics
for portal in $PORTALS; do
  test -f "analytics/${portal}-$(date --rfc-3339 date).html" ||
    curl "https://${portal}/analytics" > "analytics/${portal}-$(date --rfc-3339 date).html"
  break
done
