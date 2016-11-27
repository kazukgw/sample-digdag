#!/bin/bash
digdag server --bind $DIGDAG_BIND --port $DIGDAG_PORT \
  --config /home/digdag/properties/digdag.properties \
  -X database.type=postgresql \
  -X database.host=$DIGDAG_DB_HOST \
  -X database.port=$DIGDAG_DB_PORT \
  -X database.user=$DIGDAG_DB_USER \
  -X database.password=$DIGDAG_DB_PASSWORD \
  -X database.database=$DIGDAG_DB_NAME
