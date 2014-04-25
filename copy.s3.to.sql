require(RJDBC) # Require JDBC Driver
require(redshift) #Require Redshift Toolset 

#Create Redshift Postgresql
conn <- redshift.connect("jdbc:postgresql://prezi-research-instance.cjmsinetuw4e.us-west-2.redshift.amazonaws.com:5439/preziseasonaldb?tcpKeepAlive=true", "xxx", "xxx") # Create Redshift jdbc

#Create Tables
redshift.query(conn, "create table webtrends(grouping varchar(100), keyword varchar(100), avgmonthlyexactmatchsearches float(10), searchesapr2013 float(10), searchesmay2013 float(10), searchesjun2013 float(10), searchesjul2013 float(10), searchesaug2013 float(10), searchessep2013 float(10), searchesoct2013 float(10), searchesnov2013 float(10), searchesdec2013 float(10), searchesjan2014 float(10), searchesfeb2014 float(10), searchesmar2014 float(10), competition float(10), suggestedbid float(10), avgweightedrank float(10), mincpc float(10), maxcpc float(10), minclicksperday float(10), maxclicksperday float(10), costperday float(10), dailysearches float(10), minrundate float(10), maxrundate float(10));")
redshift.query(conn, "create table compintel(term varchar(100), avgweightedrank float(10), mincpc float(10), maxcpc float(10), minclicksperday float(10), maxclicksperday float(10), costperday float(10), dailysearches float(10), minrundate float(10), maxrundate float(10));")
#trends table already exists

#Copy S3 Storage CSV Data To Redshift
redshift.query(conn, "copy webtrends from 's3://prezi-seasonality/webtrends.csv' CREDENTIALS 'aws_access_key_id=xxx;aws_secret_access_key=xxx' delimiter ',' CSV;")
redshift.query(conn, "copy compintel from 's3://prezi-seasonality/compintel.csv' CREDENTIALS 'aws_access_key_id=xxx;aws_secret_access_key=xxx' delimiter ',' CSV;")
redshift.query(conn, "copy trends from 's3://prezi-seasonality/trends.csv' CREDENTIALS 'aws_access_key_id=AKIAJIIA4MDONFCNXORQ;aws_secret_access_key=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' delimiter ',' CSV;")
