CREATE EXTENSION parquet_s3_fdw;
SET client_min_messages = NOTICE;
CREATE SERVER test_server FOREIGN DATA WRAPPER parquet_s3_fdw OPTIONS (
  use_minio 'false',
  endpoint '127.0.0.2:9001',
  aws_region 'ap-southeast-2'
);
CREATE USER MAPPING FOR PUBLIC SERVER test_server OPTIONS (user 'foo', password 'foo');
CREATE FOREIGN TABLE foo(id INT) SERVER test_server OPTIONS (filename 's3://foo/bar');
SELECT * FROM foo;
DROP EXTENSION parquet_s3_fdw CASCADE;