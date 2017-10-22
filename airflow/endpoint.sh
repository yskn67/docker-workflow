#! /bin/sh

su airflow
cd
. airflow_python/bin/activate
airflow webserver -p 8080
