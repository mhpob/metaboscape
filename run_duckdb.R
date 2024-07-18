# follow example here: https://github.com/duckdb/duckdb-r/issues/117
library(duckdb)

con <- dbConnect(duckdb::duckdb())
dbExecute(con, "install spatial; load spatial;")
dbExecute(con, glue("create table spat as select *
          from ST_Read('{system.file('shape/nc.shp', package='sf')}')"))

# https://gis.chesapeakebay.net/ags/rest/services/Modeling/Modeling/MapServer/18
# https://gis.chesapeakebay.net/ags/rest/services/Modeling/Modeling/MapServer/18/query?where=1=1&outFields=*&f=json