====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypes
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int COMMENT 'Add a comment',
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=4);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=5);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=6);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=7);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=8);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=9);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=10);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=11);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=12);

ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=2);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=3);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=4);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=5);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=6);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=7);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=8);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=9);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=10);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=11);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=12);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090501.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090601.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090701.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090801.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/090901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091001.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=10);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=11);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/091201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=12);

LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100501.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100601.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100701.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100801.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/100901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101001.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=10);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=11);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypes/101201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=12);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesnopart
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypessmall
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=4);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesSmall/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypestiny
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=1);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=2);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=3);
ALTER TABLE {table_name} ADD PARTITION(year=2009, month=4);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090201.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090301.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesTiny/090401.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=4);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesinsert
---- CREATE
CREATE TABLE {db_name}{db_suffix}.{table_name} LIKE {db_name}.alltypes;
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesnopart_insert
---- CREATE
CREATE TABLE {db_name}{db_suffix}.{table_name} like {db_name}.alltypesnopart;
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_overwrite_nopart
---- CREATE
CREATE TABLE {db_name}{db_suffix}.{table_name} (col1 int);
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_overwrite_partitioned
---- CREATE
CREATE TABLE {db_name}{db_suffix}.{table_name} (col1 int) PARTITIONED BY (col2 int);
====
---- DATASET
functional
---- BASE_TABLE_NAME
insert_string_partitioned
---- CREATE
CREATE TABLE {db_name}{db_suffix}.{table_name} (s1 string) PARTITIONED BY (s2 string);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypeserror
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
USE {db_name}{db_suffix};
ALTER TABLE {table_name} ADD
PARTITION (year=2009, month=1)
PARTITION (year=2009, month=2)
PARTITION (year=2009, month=3);

-- Create external temp table with desired file format with same data file location
-- Tmp tables must not specify an escape character; we don't want any
-- data transformation to happen when inserting it into tmp tables.
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_tmp;
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
-- Create a temp table in text format that interprets the data as strings
DROP TABLE IF EXISTS {db_name}.{table_name}_tmp;
CREATE EXTERNAL TABLE {db_name}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{table_name}';
-- Make metastore aware of the partition directories
-- ALTER table does not take a fully qualified table name.
USE {db_name};
ALTER TABLE {table_name}_tmp ADD
PARTITION (year=2009, month=1)
PARTITION (year=2009, month=2)
PARTITION (year=2009, month=3);

-- Step 4: Stream the data from tmp text table to desired format tmp table
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}_tmp PARTITION (year, month)
SELECT * FROM {db_name}.{table_name}_tmp;

-- Cleanup the temp tables
DROP TABLE {db_name}.{table_name}_tmp;
DROP TABLE {db_name}{db_suffix}.{table_name}_tmp;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0902.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesError/0903.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypeserrornonulls
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
-- Make metastore aware of the new partitions directories
-- ALTER does not take a fully qualified name.
USE {db_name}{db_suffix};
ALTER TABLE {table_name} ADD
PARTITION (year=2009, month=1)
PARTITION (year=2009, month=2)
PARTITION (year=2009, month=3);

-- Create external temp table with desired file format with same data file location
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_tmp;
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  ESCAPED BY '\\'
STORED AS {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
-- Create a temp table in text format that interprets the data as strings
DROP TABLE IF EXISTS {db_name}.{table_name}_tmp;
CREATE EXTERNAL TABLE {db_name}.{table_name}_tmp (
  id STRING,
  bool_col STRING,
  tinyint_col STRING,
  smallint_col STRING,
  int_col STRING,
  bigint_col STRING,
  float_col STRING,
  double_col STRING,
  date_string_col STRING,
  string_col STRING,
  timestamp_col STRING)
PARTITIONED BY (year INT, month INT)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  ESCAPED BY '\\'
STORED AS TEXTFILE
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/alltypeserrornonulls';

-- Make metastore aware of the partition directories
USE {db_name};
ALTER TABLE {table_name}_tmp ADD
PARTITION (year=2009, month=1)
PARTITION (year=2009, month=2)
PARTITION (year=2009, month=3);

-- Step 4: Stream the data from tmp text table to desired format tmp table
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}_tmp PARTITION (year, month)
SELECT * FROM {db_name}.{table_name}_tmp;

-- Cleanup the temp tables
DROP TABLE {db_name}.{table_name}_tmp;
DROP TABLE {db_name}{db_suffix}.{table_name}_tmp;
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0901.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0902.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/AllTypesErrorNoNulls/0903.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2009, month=3);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesagg
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int, day int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month, day)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100102.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100103.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100104.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100105.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100106.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100107.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100108.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100109.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAgg/100110.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=10);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggnonulls
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int, day int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (year, month, day)
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day
FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100101.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=1);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100102.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=2);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100103.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=3);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100104.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=4);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100105.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=5);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100106.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=6);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100107.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=7);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100108.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=8);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100109.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=9);
LOAD DATA LOCAL INPATH '{impala_home}/testdata/target/AllTypesAggNoNulls/100110.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name} PARTITION(year=2010, month=1, day=10);
====
---- DATASET
functional
---- BASE_TABLE_NAME
testtbl
---- CREATE
-- testtbl is empty
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id bigint,
  name string,
  zip int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
====
---- DATASET
functional
---- BASE_TABLE_NAME
dimtbl
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id bigint,
  name string,
  zip int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/DimTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
jointbl
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  test_id bigint,
  test_name string,
  test_zip int,
  alltypes_id int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/JoinTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
liketbl
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  str_col string,
  match_like_col string,
  no_match_like_col string,
  match_regex_col string,
  no_match_regex_col string)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/LikeTbl/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypessmall
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,bools:bool_col,ints:tinyint_col,ints:smallint_col,ints:int_col,ints:bigint_col,floats:float_col,floats:double_col,strings:date_string_col,strings:string_col,strings:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "hbasealltypessmall");
---- LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col
FROM functional.alltypessmall;
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypeserror
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,bools:bool_col,ints:tinyint_col,ints:smallint_col,ints:int_col,ints:bigint_col,floats:float_col,floats:double_col,strings:date_string_col,strings:string_col,strings:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "hbasealltypeserror");
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypeserrornonulls
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,bools:bool_col,ints:tinyint_col,ints:smallint_col,ints:int_col,ints:bigint_col,floats:float_col,floats:double_col,strings:date_string_col,strings:string_col,strings:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "hbasealltypeserrornonulls");
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasealltypesagg
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,bools:bool_col,ints:tinyint_col,ints:smallint_col,ints:int_col,ints:bigint_col,floats:float_col,floats:double_col,strings:date_string_col,strings:string_col,strings:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "hbasealltypesagg");
---- LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name}
SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col
FROM functional.alltypesagg;
====
---- DATASET
functional
---- BASE_TABLE_NAME
hbasestringids
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id string,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
  "hbase.columns.mapping" =
  ":key,bools:bool_col,ints:tinyint_col,ints:smallint_col,ints:int_col,ints:bigint_col,floats:float_col,floats:double_col,strings:date_string_col,strings:string_col,strings:timestamp_col"
)
TBLPROPERTIES("hbase.table.name" = "hbasealltypesagg");
====
---- DATASET
functional
---- BASE_TABLE_NAME
escapenoquotes
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  col1 string,
  col2 string,
  col3 int,
  col4 int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/escape-no-quotes.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
overflow
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/data/overflow.txt' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
greptiny
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  field string)
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/grepTiny/part-00000' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
rankingssmall
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  pageRank int,
  pageURL string,
  avgDuration int)
row format delimited fields terminated by '|'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/htmlTiny/Rankings.dat' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
uservisitssmall
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  sourceIP string,
  destURL string,
  visitDate string,
  adRevenue float,
  userAgent string,
  cCode string,
  lCode string,
  sKeyword string,
  avgTimeOnSite int)
row format delimited fields terminated by '|'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/hive_benchmark/htmlTiny/UserVisits.dat' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
emptytable
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  field string)
partitioned by (f2 int);
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggmultifiles
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
partitioned by (year int, month int, day int)
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=1);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=2);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=3);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=4);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=5);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=6);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=7);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=8);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=9);
ALTER TABLE {table_name} ADD PARTITION(year=2010, month=1, day=10);
---- DEPENDENT_LOAD
insert overwrite table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT  id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM {db_name}.{table_name} where id % 4 = 3;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
insert overwrite table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} partition (year, month, day) SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col, year, month, day FROM functional.alltypesagg where id % 4 = 3;
====
---- DATASET
functional
---- BASE_TABLE_NAME
alltypesaggmultifilesnopart
---- CREATE
DROP TABLE if EXISTS {db_name}{db_suffix}.{table_name};
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int,
  bool_col boolean,
  tinyint_col tinyint,
  smallint_col smallint,
  int_col int,
  bigint_col bigint,
  float_col float,
  double_col double,
  date_string_col string,
  string_col string,
  timestamp_col timestamp)
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
insert overwrite table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM {db_name}.{table_name} where id % 4 = 3;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
SET hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
insert overwrite table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 0;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 1;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 2;
insert into table {db_name}{db_suffix}.{table_name} SELECT id, bool_col, tinyint_col, smallint_col, int_col, bigint_col, float_col, double_col, date_string_col, string_col, timestamp_col FROM functional.alltypesagg where id % 4 = 3;
====
---- DATASET
functional
---- BASE_TABLE_NAME
stringpartitionkey
---- CREATE
-- Regression for IMP-163, failure to load tables partitioned by string column
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id int)
PARTITIONED BY (string_col string)
STORED AS {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION (string_col = "partition1");
====
---- DATASET
functional
---- BASE_TABLE_NAME
tinytable
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  a string,
  b string)
row format delimited fields terminated by ','
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TinyTable/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
tinyinttable
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  int_col int)
row format delimited fields terminated by ','
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TinyIntTable/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nulltable
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  a string,
  b string,
  c string,
  d int,
  e double)
row format delimited fields terminated by ','
stored as {file_format};
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select 'a', '', NULL, NULL, NULL from {db_name}.alltypes limit 1;
---- LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select 'a', '', NULL, NULL, NULL from {db_name}.alltypes limit 1;
====
---- DATASET
functional
---- BASE_TABLE_NAME
nullescapedtable
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  a string,
  b string,
  c string,
  d int,
  e double)
row format delimited fields terminated by ',' escaped by '\\'
stored as {file_format};
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select 'a', '', NULL, NULL, NULL from {db_name}.alltypes limit 1;
---- LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} select 'a', '', NULL, NULL, NULL from {db_name}.alltypes limit 1;
====
---- DATASET
functional
---- BASE_TABLE_NAME
escapechartesttable
---- CREATE
-- Create a test data with the escape character as the same as the tuple delimiter
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (bool_col boolean)
partitioned by (id int)
row format delimited fields terminated by ',' escaped by '\n'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- ALTER
ALTER TABLE {table_name} ADD PARTITION(id=0);
ALTER TABLE {table_name} ADD PARTITION(id=1);
ALTER TABLE {table_name} ADD PARTITION(id=2);
ALTER TABLE {table_name} ADD PARTITION(id=3);
ALTER TABLE {table_name} ADD PARTITION(id=4);
ALTER TABLE {table_name} ADD PARTITION(id=5);
ALTER TABLE {table_name} ADD PARTITION(id=6);
ALTER TABLE {table_name} ADD PARTITION(id=7);
ALTER TABLE {table_name} ADD PARTITION(id=8);
ALTER TABLE {table_name} ADD PARTITION(id=9);
----  DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (id)
select bool_col,id FROM {db_name}.alltypesagg where id < 10;
---- LOAD
SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;
  SET hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} partition (id)
select bool_col,id FROM {db_name}.alltypesagg where id < 10;
====
---- DATASET
functional
---- BASE_TABLE_NAME
TblWithRaggedColumns
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  str_col string,
  int_col int)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/TblWithRaggedColumns/data.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
---- DATASET
functional
---- BASE_TABLE_NAME
nullinsert
---- CREATE
-- Must not be external
CREATE TABLE {db_name}{db_suffix}.{table_name} (
  str_col1 string,
  str_col2 string,
  str_col3 string,
  str_col4 string,
  int_cal int
)
row format delimited fields terminated by ','  escaped by '\\'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
DROP TABLE IF EXISTS {db_name}{db_suffix}.{table_name}_alt;
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name}_alt(
  whole_row string
)
row format delimited fields terminated by '|'
stored as {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
====
---- DATASET
functional
---- BASE_TABLE_NAME
zipcode_incomes
---- CREATE
CREATE EXTERNAL TABLE {db_name}{db_suffix}.{table_name} (
  id STRING,
  zip STRING,
  description1 STRING,
  description2 STRING,
  income int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS {file_format}
LOCATION '${{hiveconf:hive.metastore.warehouse.dir}}/{hdfs_location}';
---- DEPENDENT_LOAD
INSERT OVERWRITE TABLE {db_name}{db_suffix}.{table_name} SELECT * FROM {db_name}.{table_name};
---- LOAD
LOAD DATA LOCAL INPATH '{impala_home}/testdata/ImpalaDemoDataset/DEC_00_SF3_P077_with_ann_noheader.csv' OVERWRITE INTO TABLE {db_name}{db_suffix}.{table_name};
====
