CREATE SCHEMA IF NOT EXISTS app_fp;

CREATE TABLE app_fp.flp (
    flp_id              bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    name                varchar(100) NOT NULL
)
;

ALTER TABLE app_fp.flp ADD CONSTRAINT flp_id_pk PRIMARY KEY (flp_id);

COMMENT ON TABLE app_fp.flp IS 'Forest Landscape Plan. Strategic long-term plan for managing forests in an area, under the new regulation regime.'
;
COMMENT ON COLUMN app_fp.flp.flp_id IS 'Automatically generated key used to identify the uniqueness of a FLP.'
;
COMMENT ON COLUMN app_fp.flp.name IS 'Unique name of the FLP.'
;


CREATE TABLE app_fp.fop (
    fop_id              bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    name                varchar(100) NOT NULL,
    flp_id              bigint NOT NULL,
    create_user         varchar(30) NOT NULL,
    create_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user         varchar(30),
    update_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.fop ADD CONSTRAINT fop_id_pk PRIMARY KEY (fop_id);
CREATE INDEX idx_fop_flp_id ON app_fp.fop(flp_id);

ALTER TABLE app_fp.fop ADD CONSTRAINT fop_flp_id_fk
    FOREIGN KEY (flp_id)
    REFERENCES app_fp.flp(flp_id)
;

alter table app_fp.fop add constraint fop_name_uk unique (name)
;

COMMENT ON TABLE app_fp.fop IS 'Forest Operations Plan. Operational plan for managing a portion of the area within a FLP.'
;

COMMENT ON COLUMN app_fp.fop.fop_id IS 'Automatically generated key used to identify the uniqueness of a FOP.'
;
COMMENT ON COLUMN app_fp.fop.flp_id IS 'Foreign key referencing the parent FLP.'
;
COMMENT ON COLUMN app_fp.fop.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop.update_user IS 'The user or proxy account that created or last updated the record. '
;
COMMENT ON COLUMN app_fp.fop.update_date IS 'The date and time the record was created or last updated.'
;

CREATE TABLE app_fp.fop_proposal (
    fop_proposal_id     bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_id              bigint NOT NULL,
    proposal_type_code  varchar(100) NOT NULL,
    create_user         varchar(30) NOT NULL,
    create_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user         varchar(30),
    update_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.fop_proposal ADD CONSTRAINT fop_proposal_id_pk PRIMARY KEY (fop_proposal_id)
;
CREATE INDEX idx_fop_proposal_fop_id ON app_fp.fop_proposal(fop_id)
;

ALTER TABLE app_fp.fop_proposal ADD CONSTRAINT fop_proposal_fop_id_fk
    FOREIGN KEY (fop_id)
    REFERENCES app_fp.fop(fop_id)
;
COMMENT ON TABLE app_fp.fop_proposal IS 'Proposal for a specific operation within a Forest Operations Plan.'
;
COMMENT ON COLUMN app_fp.fop_proposal.fop_proposal_id IS 'Automatically generated key used to identify the uniqueness of a proposal.'
;
COMMENT ON COLUMN app_fp.fop_proposal.fop_id IS 'Foreign key referencing the parent FOP.'
;
COMMENT ON COLUMN app_fp.fop_proposal.proposal_type_code IS 'Type of proposal - Initial or Final.'
;
COMMENT ON COLUMN app_fp.fop_proposal.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop_proposal.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop_proposal.update_user IS 'The user or proxy account that created or last updated the record. '
;
COMMENT ON COLUMN app_fp.fop_proposal.update_date IS 'The date and time the record was created or last updated.'
;


CREATE TABLE app_fp.fop_preparer (
    fop_preparer_id     bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_id              bigint NOT NULL,
    preparer_name       varchar(100) NOT NULL,
    create_user         varchar(30) NOT NULL,
    create_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user         varchar(30),
    update_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.fop_preparer ADD CONSTRAINT fop_preparer_id_pk PRIMARY KEY (fop_preparer_id)
;
CREATE INDEX idx_fop_preparer_fop_id ON app_fp.fop_preparer(fop_id)
;

ALTER TABLE app_fp.fop_preparer ADD CONSTRAINT fop_preparer_fop_id_fk
    FOREIGN KEY (fop_id)
    REFERENCES app_fp.fop(fop_id)
;
COMMENT ON TABLE app_fp.fop_preparer IS 'Preparer of a FOP.'
;
COMMENT ON COLUMN app_fp.fop_preparer.fop_preparer_id IS 'Automatically generated key used to identify the uniqueness of a preparer.'
;
COMMENT ON COLUMN app_fp.fop_preparer.fop_id IS 'Foreign key referencing the FOP table.'
;
COMMENT ON COLUMN app_fp.fop_preparer.preparer_name IS 'Name of the preparer.'
;
COMMENT ON COLUMN app_fp.fop_preparer.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop_preparer.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop_preparer.update_user IS 'The user or proxy account that created or last updated the record.'
;
COMMENT ON COLUMN app_fp.fop_preparer.update_date IS 'The date and time the record was created or last updated.'
;


CREATE TABLE app_fp.fop_holder (
    fop_holder_id       bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_id              bigint NOT NULL,
    client_id           varchar(8) NOT NULL,
    create_user         varchar(30) NOT NULL,
    create_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user         varchar(30),
    update_date         TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.fop_holder ADD CONSTRAINT fop_holder_id_pk PRIMARY KEY (fop_holder_id)
;
CREATE INDEX idx_fop_holder_fop_id ON app_fp.fop_holder(fop_id)
;

ALTER TABLE app_fp.fop_holder ADD CONSTRAINT fop_holder_fop_id_fk
    FOREIGN KEY (fop_id)
    REFERENCES app_fp.fop(fop_id)
;
COMMENT ON TABLE app_fp.fop_holder IS 'Holder of a FOP.'
;
COMMENT ON COLUMN app_fp.fop_holder.fop_holder_id IS 'Automatically generated key used to identify the uniqueness of a holder.'
;
COMMENT ON COLUMN app_fp.fop_holder.fop_id IS 'Foreign key referencing the FOP table.'
;
COMMENT ON COLUMN app_fp.fop_holder.client_id IS 'Foreign key referencing Forest Client.'
;
COMMENT ON COLUMN app_fp.fop_holder.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop_holder.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop_holder.update_user IS 'The user or proxy account that created or last updated the record.'
;
COMMENT ON COLUMN app_fp.fop_holder.update_date IS 'The date and time the record was created or last updated.'
;


CREATE TABLE app_fp.fop_outcome_compliance (
    fop_outcome_compliance_id bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_proposal_id           bigint NOT NULL,
    create_user               varchar(30) NOT NULL,
    create_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user               varchar(30),
    update_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.fop_outcome_compliance ADD CONSTRAINT fop_outcome_compliance_id_pk PRIMARY KEY (fop_outcome_compliance_id)
;
CREATE INDEX idx_fop_outcome_compliance_fop_proposal_id ON app_fp.fop_outcome_compliance(fop_proposal_id)
;

ALTER TABLE app_fp.fop_outcome_compliance ADD CONSTRAINT fop_outcome_compliance_fop_proposal_id_fk
    FOREIGN KEY (fop_proposal_id)
    REFERENCES app_fp.fop_proposal(fop_proposal_id)
;
COMMENT ON TABLE app_fp.fop_outcome_compliance IS 'Outcome compliance for a specific proposal within a Forest Operations Plan.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.fop_outcome_compliance_id IS 'Automatically generated key used to identify the uniqueness of an outcome compliance record.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.fop_proposal_id IS 'Foreign key referencing the FOP_PROPOSAL table.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.update_user IS 'The user or proxy account that created or last updated the record.'
;
COMMENT ON COLUMN app_fp.fop_outcome_compliance.update_date IS 'The date and time the record was created or last updated.'
;


CREATE TABLE app_fp.forest_operations_area (
    forest_operations_area_id bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_proposal_id           bigint NOT NULL,
    spatial_area              GEOMETRY(POLYGON, 3005) not null,  
    create_user               varchar(30) NOT NULL,
    create_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user               varchar(30),
    update_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;


ALTER TABLE app_fp.forest_operations_area ADD CONSTRAINT forest_operations_area_id_pk PRIMARY KEY (forest_operations_area_id)
;
CREATE INDEX idx_forest_operations_area_fop_proposal_id ON app_fp.forest_operations_area(fop_proposal_id)
;

ALTER TABLE app_fp.forest_operations_area ADD CONSTRAINT forest_operations_area_fop_proposal_id_fk
    FOREIGN KEY (fop_proposal_id)
    REFERENCES app_fp.fop_proposal(fop_proposal_id)
;
COMMENT ON TABLE app_fp.forest_operations_area IS 'Area details for a specific proposal within a Forest Operations Plan.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.forest_operations_area_id IS 'Automatically generated key used to identify the uniqueness of an area record.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.fop_proposal_id IS 'Foreign key referencing the FOP_PROPOSAL table.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.spatial_area IS 'Polygon defining one continguous area of the FOA. Using EPSG:3005 (NAD83/BC Albers) projected coordinate system.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.update_user IS 'The user or proxy account that created or last updated the record.'
;
COMMENT ON COLUMN app_fp.forest_operations_area.update_date IS 'The date and time the record was created or last updated.'
;


CREATE TABLE app_fp.cutblock (
    cutblock_id               bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
    fop_proposal_id           bigint NOT NULL,
    spatial_area              GEOMETRY(POLYGON, 3005) not null,  
    create_user               varchar(30) NOT NULL,
    create_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_user               varchar(30),
    update_date               TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
)
;

ALTER TABLE app_fp.cutblock ADD CONSTRAINT cutblock_id_pk PRIMARY KEY (cutblock_id)
;
CREATE INDEX idx_cutblock_fop_proposal_id ON app_fp.cutblock(fop_proposal_id)
;

ALTER TABLE app_fp.cutblock ADD CONSTRAINT cutblock_fop_proposal_id_fk
    FOREIGN KEY (fop_proposal_id)
    REFERENCES app_fp.fop_proposal(fop_proposal_id)
;
COMMENT ON TABLE app_fp.cutblock IS 'Cutblock details for a specific proposal within a Forest Operations Plan.'
;
COMMENT ON COLUMN app_fp.cutblock.cutblock_id IS 'Automatically generated key used to identify the uniqueness of a cutblock record.'
;
COMMENT ON COLUMN app_fp.cutblock.fop_proposal_id IS 'Foreign key referencing the FOP_PROPOSAL table.'
;
COMMENT ON COLUMN app_fp.cutblock.spatial_area IS 'Polygon defining the area of the cutblock. Using EPSG:3005 (NAD83/BC Albers) projected coordinate system.'
;
COMMENT ON COLUMN app_fp.cutblock.create_user IS 'The user or proxy account that created the record.'
;
COMMENT ON COLUMN app_fp.cutblock.create_date IS 'The date and time the record was created.'
;
COMMENT ON COLUMN app_fp.cutblock.update_user IS 'The user or proxy account that created or last updated the record.'
;
COMMENT ON COLUMN app_fp.cutblock.update_date IS 'The date and time the record was created or last updated.'
;

-- Final step - user creation

CREATE USER ${api_db_username} WITH NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD '${api_db_password}';

GRANT USAGE ON SCHEMA app_fp TO ${api_db_username};

GRANT SELECT, UPDATE, DELETE, INSERT ON ALL TABLES IN SCHEMA app_fp TO ${api_db_username};
