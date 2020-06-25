#ConnectionMode param is helpful to connect Cosmos from company's on-premise environment
#which is behind firewall.
#the default mode is Direct, which is good when connect between azure services.

#cosmos connection configuration to connect across firewall environment

readConfig = {
  "Endpoint"       : "https://<cosmos-endpoint-url>:443",
  "Masterkey"      : "******************************==",
  "ConnectionMode" : "Gateway",
  "Database"       : "<database-name>",
  "Collection"     : "<collection-name>",
  "query_custom"   : "select * from c"
}

#code to read cosmos collection using above settings

data_df= spark.read.format("com.microsoft.azure.cosmosdb.spark").options(**readConfig).load()

data_df.printSchema()

data_df.show()