require(RJDBC) # Require JDBC Driver
require(redshift) #Require Redshift Toolset 

conn <- redshift.connect("jdbc:postgresql://prezi-research-instance.cjmsinetuw4e.us-west-2.redshift.amazonaws.com:5439/preziseasonaldb?tcpKeepAlive=true", "xxx", "xxx") # Create Redshift jdbc
