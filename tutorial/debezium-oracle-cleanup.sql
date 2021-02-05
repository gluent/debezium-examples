conn / as sysdba
ALTER SESSION SET CONTAINER = pdb193;
DROP USER debezium CASCADE;
ALTER SESSION SET CONTAINER = cdb$root;
ALTER DATABASE DROP SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER DATABASE DROP SUPPLEMENTAL LOG DATA;
BEGIN
  DBMS_XSTREAM_ADM.DROP_OUTBOUND(
    server_name  => 'dbzxout');
END;
/
DROP TABLESPACE xstream_adm_tbs INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE xstream_tbs INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE logminer_tbs INCLUDING CONTENTS AND DATAFILES;
ALTER SESSION SET CONTAINER = pdb193;
DROP TABLESPACE xstream_adm_tbs INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE xstream_tbs INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE logminer_tbs INCLUDING CONTENTS AND DATAFILES;
ALTER SESSION SET CONTAINER = cdb$root;
DROP USER c##xstrmadmin CASCADE;
DROP USER c##xstrm CASCADE;
DROP USER c##logminer CASCADE;
ALTER SYSTEM RESET enable_goldengate_replication;
SHUTDOWN IMMEDIATE
STARTUP MOUNT
ALTER DATABASE NOARCHIVELOG;
ALTER DATABASE OPEN;
HOST rm -rf /opt/oracle/oradata/recovery_area
