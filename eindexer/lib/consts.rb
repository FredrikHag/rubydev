BASEURL = "http://localhost:9200"
AUTHORIZATION = "Basic ZWxhc3RpYzpuSHRHellIK0dybGZ1ZzNodlZUSw=="
#"Bearer AAEAAWVsYXN0aWMva2liYW5hL3Rlc3QxOm1ZeW9OZHVjU3ZXS2dzNTN5NFRGSXc"
CONTENT_TYPE = "application/json"

END_OF_FILE = -1



#Counter
EXCLUDED_WORDCOUNTS = ["THE", "OF", "TO", "FROM", "WHEN", "IF", "YOU",
     "FOR", "BE", "WITH", "CAN", "IS", "A", "AN", "OR", "IN", "AND", "THEN", "ARE", "BY", "AS", "NOT", "WILL",
    "DO", "ON", "WELL", "ETC", "IE", "ON", "PAGE", "WE", "NO", "UP", "FEW", "HAS", "LOOK", "LIKE",
"IT", "THAT", "YOUR", "SEE", "SO", "THIS", "MAY", "VERY", "PLAIN", "USE", "ALSO", "DUE", "WILL", "ANY", "BUT", "SAME"]
TOP_WORD_SIZE = 10


#SSL

CA_FILE = "/home/fredrik/Desktop/Elasticsearch/http_ca.crt"
USE_SSL = false