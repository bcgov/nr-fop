CREATE SCHEMA IF NOT EXISTS app_fp;

    -- name           varchar(100)    NOT NULL,

CREATE TABLE app_fp.fop (
    fop_id             bigint          GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    create_user                varchar(30)     NOT NULL,
    create_date                TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user                varchar(30),
    update_date                TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

-- alter table app_fop.fop add constraint fop_name_uk unique (name)
-- ;

COMMENT ON TABLE app_fp.fop IS 'Forest Operations Plan. Operational plan for managing a portion of the area within a FLP.'
;

COMMENT ON COLUMN app_fp.fop.fop_id IS 'Automatically generated key used to identify the uniqueness of a FOP'
;
COMMENT ON COLUMN app_fp.fop.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop.update_user IS 'The user or proxy account that created or last updated the record. '
;
COMMENT ON COLUMN app_fp.fop.update_date IS 'The date and time the record was created or last updated.'
;


    -- application_id           bigint,
-- ALTER TABLE app_fam.fam_application_client ADD CONSTRAINT Reffam_application31 
--     FOREIGN KEY (application_id)
--     REFERENCES app_fam.fam_application(application_id)
-- ;


-- CREATE INDEX "Ref219" ON app_fam.fam_application_group_xref(group_id)




CREATE USER ${api_db_username} WITH NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD '${api_db_password}';

GRANT USAGE ON SCHEMA app_fp TO ${api_db_username};

GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA app_fp TO ${api_db_username};
