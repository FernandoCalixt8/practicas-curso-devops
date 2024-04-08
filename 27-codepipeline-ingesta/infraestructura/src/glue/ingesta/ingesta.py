import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME', 'bucket_ingesta', 'landing_zone_path', 'staging_zone_path'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# variables
bucket_ingesta          = args['bucket_ingesta']
landing_zone_path       = args['landing_zone_path']
staging_zone_path       = args['staging_zone_path']

# escritura
ingesta_historica_df    = spark.read.option('header', True).csv(f's3://{bucket_ingesta}/{landing_zone_path}')
ingesta_historica_df.write.partitionBy('year').mode('append').parquet(f's3://{bucket_ingesta}/{staging_zone_path}')

job.commit()