from pyspark.sql import SparkSession
import os

# Public key generated on `ennablData -> Data Access` page (https://app.ennabl.com/command/data-access/connect)
ennabl_data_access_key = os.environ["ENNABL_DATA_ACCESS_KEY"]
# Secret key generated on `ennablData -> Data Access` page (https://app.ennabl.com/command/data-access/connect)
ennabl_data_secret_key = os.environ["ENNABL_DATA_SECRET_KEY"]
# Must be `ennabl-external`
ennabl_workgroup_name = "ennabl-external"
# Must be `data_marts_current`
ennabl_data_mart_db = "data_marts_current"

connection_string = f"jdbc:awsathena://" \
                    f"User={ennabl_data_access_key};" \
                    f"Password={ennabl_data_secret_key};" \
                    f"Workgroup={ennabl_workgroup_name};" \
                    f"AwsRegion=us-east-1;"

spark = SparkSession.builder.getOrCreate()


def load_data_mart(name):
    """
    Loads specified data mart into spark DataFrame.

    :param name: the name of the data mart to load
    :return: spark DataFrame
    """
    return spark.read.format("jdbc") \
        .option("url", connection_string) \
        .option("dbtable", f"{ennabl_data_mart_db}.{name}") \
        .option("driver", "com.simba.athena.jdbc.Driver") \
        .load()


ennabl_employee = load_data_mart("ennabl_employee")
ennabl_employee.show()
