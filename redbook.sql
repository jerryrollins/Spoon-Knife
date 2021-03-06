CREATE TABLE SAW_STATUS ("STATUS_ID" BIGINT NOT NULL,"STATUS_NAME" CHAR(20) NOT NULL) DATA CAPTURE NONE;
ALTER TABLE SAW_STATUS ADD CONSTRAINT "CC1408484744159" PRIMARY KEY ("STATUS_ID");
COMMENT ON TABLE SAW_STATUS IS 'SG24-8243 Redbook Status table';
insert into SAW_STATUS values (0, 'PENDING');
insert into SAW_STATUS values (1, 'APPROVED');
insert into SAW_STATUS values (2, 'REJECTED');
CREATE TABLE SAW_REQUESTS ("REQUEST_ID" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY ( START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 NO CYCLE NO CACHE),
"SERIAL_NUMBER" CHAR(20) NOT NULL,
"NAME" CHAR(100) NOT NULL,
"TRACKING_NUMBER" CHAR(20) NOT NULL,
"ADDRESS" CHAR(150) NOT NULL,
"STATUS_ID" BIGINT NOT NULL,
"CREATION_TIME" TIMESTAMP,
"REMARKS" CHAR(200),
"COMMENTS" CHAR(200))
DATA CAPTURE NONE COMPRESS YES;
ALTER TABLE SAW_REQUESTS ADD CONSTRAINT "CC1408485016720" PRIMARY KEY ("REQUEST_ID");
ALTER TABLE SAW_REQUESTS ADD CONSTRAINT "CC1408485022210" FOREIGN KEY ("STATUS_ID") REFERENCES SAW_STATUS("STATUS_ID");
COMMENT ON TABLE SAW_REQUESTS IS 'SG24-8243 Redbook Requests table';