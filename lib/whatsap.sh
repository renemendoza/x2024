#!/bin/bash

#curl -i -X POST \
#  https://graph.facebook.com/v18.0/249482301590790/messages \
#  -H 'Authorization: Bearer EAAjy5QHHPG4BOZBFsUgcfhhDFm7kxPrP1Uz0AZCRTOj3Ew2mOZAfUcYssZBoXYqU8rmZASZAbrYjevxJzuPd8tAZAPntNZCF3coNqZAFSCgmZCVBAYrNrJmxxuLgvmyfqmJkLyzn3v4LE1hxzS6rv1uEA4uppSVunpUdYO1R6ZCB0K2F22vSr8DIJIqIF3KC1s55RuIn2I6E6b1OxpJez0t' \
#  -H 'Content-Type: application/json' \
#  -d '{ "messaging_product": "whatsapp", "to": "529988905221", "type": "template", "template": { "name": "hello_world", "language": { "code": "en_US" } } }'
#-d '{
#    "cc": "52",
#    "phone_number": "5629641915",
#    "verified_name": "Soporte Inter-Digita"
#}'


    #"type": "template",
    #"template": { "name": "hello_world", "language": { "code": "en_US" } }


curl -X POST https://graph.facebook.com/v19.0/249482301590790/messages \
-H 'Authorization: Bearer EAAjy5QHHPG4BOZBFsUgcfhhDFm7kxPrP1Uz0AZCRTOj3Ew2mOZAfUcYssZBoXYqU8rmZASZAbrYjevxJzuPd8tAZAPntNZCF3coNqZAFSCgmZCVBAYrNrJmxxuLgvmyfqmJkLyzn3v4LE1hxzS6rv1uEA4uppSVunpUdYO1R6ZCB0K2F22vSr8DIJIqIF3KC1s55RuIn2I6E6b1OxpJez0t' \
-H 'Content-Type: application/json' \
-d '{
    "messaging_product": "whatsapp",
    "recipient_type": "individual",
    "to": "529988905221",
    "type": "text",
    "text": { 
      "preview_url": true,
      "body": "que trampa soy el robot"
    }
}'
