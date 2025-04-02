-- Table to store company information
CREATE TABLE "companies" (
    "id" INTEGER,  -- Unique identifier for each company
    "company_name" TEXT NOT NULL,  -- Name of the company (mandatory)
    "address" TEXT NOT NULL, -- Physical address of the company (mandatory)
    PRIMARY KEY("id") -- Defines 'id' as the primary key
);

-- Table to store analysis data for cooling systems
CREATE TABLE "cooling_system_analysis" (
    "id" INTEGER, -- Unique identifier for each analysis entry
    "calculated_liquid_line_subcooling" NUMERIC(6,2), -- Measured subcooling in liquid line (precision: 6 digits, 2 decimal places)
    "liquid_sight_glass_condition" TEXT CHECK("liquid_sight_glass_condition" IN ('full','bubbles',NULL)),-- Condition of sight glass with allowed values
    "calculated_evaporator_superheat" NUMERIC(6,2),  -- Measured evaporator superheat value
    "calculated_evaporator_temperature" NUMERIC(6,2), -- Temperature at the evaporator
    "calculated_condensing_temperature" NUMERIC(6,2),  -- Temperature at the condenser
    PRIMARY KEY ("id")-- Defines 'id' as the primary key
);

-- Table to store contact details associated with companies, ensuring data consistency and relationships
CREATE TABLE "contacts" (
    "id" INTEGER , -- Unique identifier for each contact
    "first_name" TEXT NOT NULL,  -- First name of the contact (mandatory)
    "last_name" TEXT NOT NULL,  -- Last name of the contact (mandatory)
    "company_id" INTEGER, -- Foreign key referencing 'companies' table
    "email" TEXT NOT NULL UNIQUE,  -- Unique email address of the contact (mandatory)
    "phone" TEXT NOT NULL UNIQUE, -- Unique phone number of the contact (mandatory)
    PRIMARY KEY ("id"),-- Defines 'id' as the primary key
    FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE CASCADE -- Ensures 'company_id' references a valid company, deletes contacts if the company is deleted
);

-- Table to store condensing unit details, tracking essential attributes
CREATE TABLE "condensing_units" (
    "id" INTEGER, -- Unique identifier for each condensing unit
    "brand" TEXT NOT NULL,  -- Brand name of the condensing unit (mandatory)
    "model" TEXT NOT NULL, -- Model number of the condensing unit (mandatory)
    "serie" TEXT NOT NULL, -- Serial number of the condensing unit (mandatory)
    PRIMARY KEY ("id")-- Defines 'id' as the primary key
);

-- Table to store compressor details, ensuring structured relationships with condensing units
CREATE TABLE "compressors" (
    "id" INTEGER, -- Unique identifier for each compressor (Primary Key)
    "installation_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date of installation, defaults to the current timestamp
    "model" TEXT NOT NULL, -- Model of the compressor (mandatory)
    "serie" TEXT NOT NULL, -- Serial number of the compressor (mandatory)
    "oil_type" TEXT NOT NULL,  -- Type of oil used in the compressor (mandatory)
    PRIMARY KEY ("id")-- Defines 'id' as the primary key
);

-- Table to store evaporator details
CREATE TABLE "evaporators" (
    "id" INTEGER,-- Unique identifier for each evaporator (Primary Key)
    "brand" TEXT NOT NULL, -- Brand of the evaporator (mandatory)
    "model" TEXT NOT NULL, -- Model of the evaporator (mandatory)
    "serie" TEXT NOT NULL, -- Serial number of the evaporator (mandatory)
    PRIMARY KEY ("id") -- Defines 'id' as the primary key
);

-- Table to store expansion valve details
CREATE TABLE "expansion_valves" (
    "id" INTEGER,  -- Unique identifier for each expansion valve (Primary Key)
    "brand" TEXT NOT NULL, -- Brand of the expansion valve (mandatory)
    "model" TEXT NOT NULL, -- Model of the expansion valve (mandatory)
    "capacity" NUMERIC(10,2),  -- Cooling capacity of the valve, with up to 10 digits and 2 decimal places
    "refrigerant_gas" TEXT NOT NULL,  -- Type of refrigerant gas the valve is designed for (mandatory)
    "type_of_thaw" TEXT NOT NULL, -- Type of defrosting mechanism used in the system (mandatory)
    "cut_in" NUMERIC(6,2), -- Pressure or temperature level where the valve activates (cut-in point)
    "cut_out" NUMERIC(6,2), -- Pressure or temperature level where the valve stops operation (cut-out point)
    PRIMARY KEY ("id")-- Defines 'id' as the primary key
);

-- Create the "cooling_systems" table
CREATE TABLE "cooling_systems" (
    "id" INTEGER, -- Unique identifier for each cooling system
    "condensing_unit_id" INTEGER UNIQUE, -- Foreign key for the condensing unit
    "compressor_id" INTEGER UNIQUE, -- Foreign key for the compressor
    "evaporator_id" INTEGER UNIQUE, -- Foreign key for the evaporator
    "expansion_valve_id" INTEGER UNIQUE, -- Foreign key for the expansion valve
    "company_id" INTEGER, -- Foreign key for the company
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("condensing_unit_id") REFERENCES "condensing_units"("id"),
    FOREIGN KEY ("compressor_id") REFERENCES "compressors"("id"),
    FOREIGN KEY ("evaporator_id") REFERENCES "evaporators"("id"),
    FOREIGN KEY ("expansion_valve_id") REFERENCES "expansion_valves"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE CASCADE -- Cascade delete on company deletion
);

-- Create the "compressor_lectures" table
CREATE TABLE "compressor_lectures" (
    "id" INTEGER, -- Unique identifier for each lecture
    "discharge_pressure" NUMERIC(6,2), -- Discharge pressure value
    "saturation_temperature_at_discharge_pressure" NUMERIC(6,2), -- Saturation temperature at discharge pressure
    "suction_pressure" NUMERIC(6,2), -- Suction pressure value
    "saturation_temperature_at_suction_pressure" NUMERIC(6,2), -- Saturation temperature at suction pressure
    "current_suction_temperature" NUMERIC(6,2), -- Current suction temperature
    "compressor_crankcase_temperature" NUMERIC(6,2), -- Crankcase temperature of the compressor
    "cut_in_for_low_pressure" NUMERIC(6,2), -- Cut-in pressure for low pressure
    "cut_out_for_low_pressure" NUMERIC(6,2), -- Cut-out pressure for low pressure
    "oil_level_in_the_sight_glass" TEXT NOT NULL CHECK("oil_level_in_the_sight_glass" IN ('empty','1/2','1/4','3/4','full')), -- Oil level check
    "num_phases" TEXT NOT NULL CHECK("num_phases" IN ('single phase', 'three phase')), -- Phase check
    "voltage_l1" NUMERIC(6,2), -- Voltage on L1 phase
    "voltage_l2" NUMERIC(6,2), -- Voltage on L2 phase
    "voltage_l3" NUMERIC(6,2), -- Voltage on L3 phase
    "amp_l1" NUMERIC(6,2), -- Current on L1 phase
    "amp_l2" NUMERIC(6,2), -- Current on L2 phase
    "amp_l3" NUMERIC(6,2), -- Current on L3 phase
    "coil_resistance_(three-phase)" NUMERIC(6,2), -- Coil resistance for three-phase
    "coil_resistance_(single-phase)_common_start" NUMERIC(6,2), -- Coil resistance for single-phase (common start)
    "coil_resistance_(single-phase)_common_run" NUMERIC(6,2), -- Coil resistance for single-phase (common run)
    "compressor_id" INTEGER, -- Foreign key for the compressor
    "cooling_system_analysis_id" INTEGER UNIQUE, -- Foreign key for the cooling system analysis
    "lecture_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Lecture datetime (defaults to current timestamp)
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("compressor_id") REFERENCES "compressors"("id") ON DELETE CASCADE,
    FOREIGN KEY ("cooling_system_analysis_id") REFERENCES "cooling_system_analysis"("id") ON DELETE CASCADE
);

-- Create the "expansion_valve_inlet_lectures" table
CREATE TABLE "expansion_valve_inlet_lectures" (
    "id" INTEGER, -- Unique identifier for each lecture
    "temperature_at_the_filter_dryer_inlet" NUMERIC(6,2), -- Temperature at the filter dryer inlet
    "temperature_at_the_filter_dryer_outlet" NUMERIC(6,2), -- Temperature at the filter dryer outlet
    "liquid_line_pressure" NUMERIC(6,2), -- Pressure in the liquid line
    "saturated_temperature_at_condensation_pressure" NUMERIC(6,2), -- Saturation temperature at condensation pressure
    "liquid_line_temperature" NUMERIC(6,2), -- Temperature in the liquid line
    "liquid_sight_glass_condition" TEXT NOT NULL CHECK("liquid_sight_glass_condition" IN ('full', 'bubbles')), -- Liquid sight glass condition
    "expansion_valve_id" INTEGER, -- Foreign key for the expansion valve
    "cooling_system_analysis_id" INTEGER UNIQUE, -- Foreign key for the cooling system analysis
    "lecture_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Lecture datetime (defaults to current timestamp)
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("expansion_valve_id") REFERENCES "expansion_valves"("id") ON DELETE CASCADE,
    FOREIGN KEY ("cooling_system_analysis_id") REFERENCES "cooling_system_analysis"("id") ON DELETE CASCADE
);

-- Create the "evaporator_outlet_lectures" table
CREATE TABLE "evaporator_outlet_lectures" (
    "id" INTEGER, -- Unique identifier for each lecture
    "suction_pressure" NUMERIC(6,2), -- Suction pressure value
    "saturated_temperature_at_suction_pressure" NUMERIC(6,2), -- Saturation temperature at suction pressure
    "current_suction_temperature" NUMERIC(6,2), -- Current suction temperature
    "cold_room_temperature" NUMERIC(6,2), -- Cold room temperature
    "temperature_of_the_air_entering_the_evaporator" NUMERIC(6,2), -- Air temperature entering the evaporator
    "evaporator_design_td" NUMERIC(6,2), -- Evaporator design temperature difference (TD)
    "evaporator_id" INTEGER, -- Foreign key for the evaporator
    "cooling_system_analysis_id" INTEGER UNIQUE, -- Foreign key for the cooling system analysis
    "lecture_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Lecture datetime (defaults to current timestamp)
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("evaporator_id") REFERENCES "evaporators"("id") ON DELETE CASCADE,
    FOREIGN KEY ("cooling_system_analysis_id") REFERENCES "cooling_system_analysis"("id") ON DELETE CASCADE
);

-- Create the "condensing_unit_lectures" table
CREATE TABLE "condensing_unit_lectures" (
    "id" INTEGER, -- Unique identifier for each lecture
    "room_temperature" NUMERIC(6,2), -- Room temperature
    "condenser_inlet_air_temperature" NUMERIC(6,2), -- Inlet air temperature at the condenser
    "condenser_outlet_air_temperature" NUMERIC(6,2), -- Outlet air temperature at the condenser
    "condensing_unit_id" INTEGER, -- Foreign key for the condensing unit
    "cooling_system_analysis_id" INTEGER UNIQUE, -- Foreign key for the cooling system analysis
    "lecture_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Lecture datetime (defaults to current timestamp)
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("condensing_unit_id") REFERENCES "condensing_units"("id") ON DELETE CASCADE,
    FOREIGN KEY ("cooling_system_analysis_id") REFERENCES "cooling_system_analysis"("id") ON DELETE CASCADE
);

-- Create the "diagnoses" table
CREATE TABLE "diagnoses" (
    "id" INTEGER, -- Unique identifier for each diagnosis
    "condensation_temperature_status" TEXT CHECK("condensation_temperature_status" IN ('high','normal','low',NULL)), -- Condensation temperature status
    "liquid_line_subcooling_status" TEXT CHECK("liquid_line_subcooling_status" IN ('high','normal','low',NULL)), -- Liquid line subcooling status
    "evaporator_temperature_status" TEXT CHECK("evaporator_temperature_status" IN ('high','normal','low',NULL)), -- Evaporator temperature status
    "evaporator_superheat_status" TEXT CHECK("evaporator_superheat_status" IN ('high','normal','low',NULL)), -- Evaporator superheat status
    "liquid_sight_glass_status" TEXT CHECK("liquid_sight_glass_status" IN ('full','bubbles',NULL)), -- Liquid sight glass status
    "cooling_system_analysis_id" INTEGER UNIQUE, -- Foreign key for the cooling system analysis
    "diagnose_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Diagnosis datetime (defaults to current timestamp)
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("cooling_system_analysis_id") REFERENCES "cooling_system_analysis"("id") ON DELETE CASCADE
);

-- Create the "possible_problems" table
CREATE TABLE "possible_problems" (
    "id" INTEGER, -- Unique identifier for each problem
    "description" TEXT, -- Description of the problem
    "condensation_temperature_status" TEXT CHECK("condensation_temperature_status" IN ('high','normal','low',NULL)), -- Condensation temperature status
    "liquid_line_subcooling_status" TEXT CHECK("liquid_line_subcooling_status" IN ('high','normal','low',NULL)), -- Liquid line subcooling status
    "evaporator_temperature_status" TEXT CHECK("evaporator_temperature_status" IN ('high','normal','low',NULL)), -- Evaporator temperature status
    "evaporator_superheat_status" TEXT CHECK("evaporator_superheat_status" IN ('high','normal','low',NULL)), -- Evaporator superheat status
    "liquid_sight_glass_status" TEXT CHECK("liquid_sight_glass_status" IN ('full','bubbles',NULL)), -- Liquid sight glass status
    PRIMARY KEY ("id") -- Defines 'id' as the primary key
);

-- Create the "problems_probabilities" table
CREATE TABLE "problems_probabilities" (
    "id" INTEGER, -- Unique identifier for each record
    "problem_id" INTEGER, -- Foreign key for the problem
    "diagnose_id" INTEGER, -- Foreign key for the diagnosis
    "probability" NUMERIC(6,2), -- Probability value for the problem diagnosis
    PRIMARY KEY ("id"), -- Defines 'id' as the primary key
    -- Foreign key relationships
    FOREIGN KEY ("problem_id") REFERENCES "possible_problems"("id") ON DELETE CASCADE,
    FOREIGN KEY ("diagnose_id") REFERENCES "diagnoses"("id") ON DELETE CASCADE
);

-- for each new insert in lectures tables it is evaluated if the id of the analysis exist in the cooling_system_analysis, if it exist this is updated.
-- This cooling_system_analysis_id exist for the case when there are diferent lectures of different parts and we need to relate all of them in one analysis

-- The following are triggers to generate the data to the tables for the cooling_system_analysis calculating data from the lectures tables
CREATE TRIGGER "generate_analysis_compressor_UPDATE"
BEFORE UPDATE ON "compressor_lectures"
FOR EACH ROW
BEGIN
    INSERT INTO "cooling_system_analysis" ("id")
    VALUES (
        NEW.cooling_system_analysis_id
    )
    ON CONFLICT ("id") DO NOTHING ;
END;

CREATE TRIGGER "generate_analysis_compressor_INSERT"
BEFORE INSERT ON "compressor_lectures"
FOR EACH ROW
BEGIN
    INSERT INTO "cooling_system_analysis" ("id")
    VALUES (
        NEW.cooling_system_analysis_id
    )
    ON CONFLICT ("id") DO NOTHING ;
END;


CREATE TRIGGER "generate_analysis_evaporator_INSERT"
BEFORE INSERT ON "evaporator_outlet_lectures"
FOR EACH ROW
BEGIN
    INSERT INTO "cooling_system_analysis" ("id","calculated_evaporator_superheat","calculated_evaporator_temperature")
    VALUES (
        NEW.cooling_system_analysis_id, -- the id of each cooling_system_analysis is determined by the id selected on each insert of the lectures tables
        (NEW.current_suction_temperature - NEW.saturated_temperature_at_suction_pressure),
        (NEW.temperature_of_the_air_entering_the_evaporator - NEW.evaporator_design_td)
    )
    ON CONFLICT("id") DO UPDATE SET -- This ON CONFLICT is important to update the information from different lectures tables on one same row on the cooling_system_analysis table
     "calculated_evaporator_superheat" = (NEW.current_suction_temperature - NEW.saturated_temperature_at_suction_pressure),
     "calculated_evaporator_temperature" = (NEW.temperature_of_the_air_entering_the_evaporator - NEW.evaporator_design_td)
     WHERE "id" = NEW.cooling_system_analysis_id;
END;


-- Trigger to insert the data neccesary from the table expansion_valve_inlet_lectures for the analysis on the cooling_system_analysis table
-- In case that the tables of lectures were updated, this triggers will update the corresponding cooling_system_analysis row too
CREATE TRIGGER "generate_analysis_evaporator_UPDATE"
BEFORE UPDATE ON "evaporator_outlet_lectures"
FOR EACH ROW
BEGIN
    UPDATE "cooling_system_analysis"
    SET
     "calculated_evaporator_superheat" = (NEW.current_suction_temperature - NEW.saturated_temperature_at_suction_pressure),
     "calculated_evaporator_temperature" = (NEW.temperature_of_the_air_entering_the_evaporator - NEW.evaporator_design_td)
     WHERE "id" = NEW.cooling_system_analysis_id;
END;

-- Trigger to insert the data neccesary from the table expansion_valve_inlet_lectures for the analysis on the cooling_system_analysis table
CREATE TRIGGER "generate_analysis_expansion_valve_INSERT"
BEFORE INSERT ON "expansion_valve_inlet_lectures"
FOR EACH ROW
BEGIN
    INSERT INTO "cooling_system_analysis" ("id","calculated_liquid_line_subcooling","liquid_sight_glass_condition")
    VALUES (
        NEW.cooling_system_analysis_id,
        (NEW.saturated_temperature_at_condensation_pressure-NEW.liquid_line_temperature),
        NEW.liquid_sight_glass_condition
    )
    ON CONFLICT("id") DO UPDATE SET
     "calculated_liquid_line_subcooling" = (NEW.saturated_temperature_at_condensation_pressure-NEW.liquid_line_temperature),
     "liquid_sight_glass_condition" = NEW.liquid_sight_glass_condition WHERE "id" = NEW.cooling_system_analysis_id;
END;


CREATE TRIGGER "generate_analysis_expansion_valve_UPDATE"
BEFORE UPDATE ON "expansion_valve_inlet_lectures"
FOR EACH ROW
BEGIN
    UPDATE "cooling_system_analysis"
    SET
     "calculated_liquid_line_subcooling" = (NEW.saturated_temperature_at_condensation_pressure-NEW.liquid_line_temperature),
     "liquid_sight_glass_condition" = NEW.liquid_sight_glass_condition
     WHERE "id" = NEW.cooling_system_analysis_id;
END;

CREATE TRIGGER "generate_analysis_condensing_INSERT"
BEFORE INSERT ON "condensing_unit_lectures"
FOR EACH ROW
BEGIN
    INSERT INTO "cooling_system_analysis" ("id","calculated_condensing_temperature")
    VALUES (
        NEW.cooling_system_analysis_id,
        ((--condensig temperature
            SELECT "saturation_temperature_at_discharge_pressure" FROM "compressor_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            )
        - ( -- calculating standard condensing temperature
            NEW.room_temperature + (
            SELECT "temperature_of_the_air_entering_the_evaporator" FROM "evaporator_outlet_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            ))
        )
    )
    ON CONFLICT("id") DO UPDATE SET
     "calculated_condensing_temperature" = ((--condensig temperature
            SELECT "saturation_temperature_at_discharge_pressure" FROM "compressor_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            )
        - ( -- calculating standard condensing temperature
            NEW.room_temperature + (
            SELECT "temperature_of_the_air_entering_the_evaporator" FROM "evaporator_outlet_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            ))
        ) WHERE "id" = NEW.cooling_system_analysis_id;

END;

CREATE TRIGGER "generate_analysis_condensing_UPDATE"
BEFORE UPDATE ON "condensing_unit_lectures"
FOR EACH ROW
BEGIN
    UPDATE "cooling_system_analysis"
    SET
     "calculated_condensing_temperature" = ((--condensig temperature
            SELECT "saturation_temperature_at_discharge_pressure" FROM "compressor_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            )
        - ( -- calculating standard condensing temperature
            NEW.room_temperature + (
            SELECT "temperature_of_the_air_entering_the_evaporator" FROM "evaporator_outlet_lectures"
            WHERE "cooling_system_analysis_id" = NEW.cooling_system_analysis_id
            ))
        ) WHERE "id" = NEW.cooling_system_analysis_id;

END;

-- After complete the analysis record, now this are the triggers to generate the diagnose

CREATE TRIGGER "generate_diagnose_INSERT"
AFTER INSERT ON "cooling_system_analysis"
FOR EACH ROW
WHEN (SELECT COUNT(*) FROM "cooling_system_analysis" WHERE "id"=NEW.id)>0
BEGIN
    INSERT INTO "diagnoses" ("condensation_temperature_status", "liquid_line_subcooling_status", "evaporator_temperature_status", "evaporator_superheat_status", "liquid_sight_glass_status",  "cooling_system_analysis_id" )
    VALUES ((
        CASE
            WHEN NEW.calculated_condensing_temperature = 0 THEN 'normal'
            WHEN NEW.calculated_condensing_temperature >= 10 THEN 'high'
            WHEN NEW.calculated_liquid_line_subcooling < 10
                AND NEW.calculated_liquid_line_subcooling > 0 THEN 'low'
            ELSE NULL
        END
    ),(
        CASE
            WHEN NEW.calculated_liquid_line_subcooling >= 5 AND NEW.calculated_liquid_line_subcooling < 20 THEN 'normal'
            WHEN NEW.calculated_liquid_line_subcooling < 5 THEN 'low'
            WHEN NEW.calculated_liquid_line_subcooling = 20 THEN 'high'
            ELSE NULL

        END
    ),(
        CASE
            WHEN NEW.calculated_evaporator_temperature > 10 THEN 'high'
            WHEN NEW.calculated_evaporator_temperature < 10 AND NEW.calculated_evaporator_temperature > 0 THEN 'low'
            WHEN NEW.calculated_evaporator_temperature = 0 THEN 'normal'
            ELSE NULL
        END
    ),(
        CASE
            WHEN NEW.calculated_evaporator_superheat = 10 THEN 'normal'
            WHEN NEW.calculated_evaporator_superheat > 10 THEN 'high'
            WHEN NEW.calculated_evaporator_superheat < 10 THEN 'low'
            ELSE NULL
        END
    ), NEW.liquid_sight_glass_condition, NEW.id
    );
END;

CREATE TRIGGER "generate_diagnose_UPDATE"
AFTER UPDATE ON "cooling_system_analysis"
FOR EACH ROW
WHEN (SELECT COUNT(*) FROM "cooling_system_analysis" WHERE "id"=NEW.id)>0
BEGIN
    UPDATE "diagnoses"
    SET
        "condensation_temperature_status" = CASE
            WHEN NEW.calculated_condensing_temperature = 0 THEN 'normal'
            WHEN NEW.calculated_condensing_temperature >= 10 THEN 'high'
            WHEN NEW.calculated_liquid_line_subcooling < 10
                AND NEW.calculated_liquid_line_subcooling > 0 THEN 'low'
            ELSE NULL
        END,

        "liquid_line_subcooling_status" = CASE
            WHEN NEW.calculated_liquid_line_subcooling >= 5
                AND NEW.calculated_liquid_line_subcooling < 20 THEN 'normal'
            WHEN NEW.calculated_liquid_line_subcooling < 5 THEN 'low'
            WHEN NEW.calculated_liquid_line_subcooling = 20 THEN 'high'
            ELSE NULL
        END,

        "evaporator_temperature_status" = CASE
            WHEN NEW.calculated_evaporator_temperature > 10 THEN 'high'
            WHEN NEW.calculated_evaporator_temperature < 10
                AND NEW.calculated_evaporator_temperature > 0 THEN 'low'
            WHEN NEW.calculated_evaporator_temperature = 0 THEN 'normal'
            ELSE NULL
        END,

        "evaporator_superheat_status" = CASE
            WHEN NEW.calculated_evaporator_superheat = 10 THEN 'normal'
            WHEN NEW.calculated_evaporator_superheat > 10 THEN 'high'
            WHEN NEW.calculated_evaporator_superheat < 10 THEN 'low'
            ELSE NULL
        END,

        "liquid_sight_glass_status" = NEW.liquid_sight_glass_condition
        WHERE
        "cooling_system_analysis_id" = NEW.id;
END;


CREATE TRIGGER "identify_problems_INSERT"
AFTER INSERT ON "diagnoses"
FOR EACH ROW
BEGIN
    INSERT INTO "problems_probabilities" ("problem_id","diagnose_id","probability") VALUES
    (1,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(2,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(3,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(4,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(5,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(6,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(7,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(8,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    )),(9,NEW.id,(
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ));

END;

 -- Trigerr for fill the table problems_probabilities based on the logic to determine the posibilities of the problems that are evaluated
CREATE TRIGGER "identify_problems_UPDATE"
AFTER UPDATE ON "diagnoses"
FOR EACH ROW
BEGIN
    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 1) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 1 AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 2) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 2  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 3) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 3  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 4) THEN 1 ELSE 1 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 4  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 5) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 5  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 6) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 6  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 7) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 7  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 8) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 8  AND "diagnose_id" = NEW.id;

    UPDATE "problems_probabilities"
    SET "probability" = (
        SELECT (
            CASE WHEN "condensation_temperature_status" = (SELECT "condensation_temperature_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_line_subcooling_status" = (SELECT "liquid_line_subcooling_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_temperature_status" = (SELECT "evaporator_temperature_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "evaporator_superheat_status" = (SELECT "evaporator_superheat_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END +
            CASE WHEN "liquid_sight_glass_status" = (SELECT "liquid_sight_glass_status" FROM "possible_problems" WHERE "id" = 9) THEN 1 ELSE 0 END
        ) AS 'matches' FROM "diagnoses" WHERE "id" = NEW.id
    ) WHERE "problem_id" = 9  AND "diagnose_id" = NEW.id;
END;


-- THIS IS A VIEW OF THE COMPANIES THAT HAVE COOLING SYSTEMS WITH MORE THAN 3 PROBABLES PROBLEM (IT IS CONSIDERED AS A PROBLEM WHEN THE PROBABILITY IS MORE THAN 2)
CREATE VIEW "companies_with_problems" AS
SELECT "id","company_name" FROM "companies"
WHERE "id" IN (
    SELECT "company_id" FROM "cooling_systems"
    WHERE "compressor_id" IN (
        SELECT "compressor_id" FROM "compressor_lectures"
        WHERE "cooling_system_analysis_id" IN (
            SELECT "cooling_system_analysis_id" FROM "diagnoses"
            WHERE "id" IN (
                SELECT "diagnose_id" FROM (
                    SELECT "diagnose_id", COUNT("probability") AS "num_problems" FROM "problems_probabilities"
                    WHERE "probability" > 2
                    GROUP BY "diagnose_id"
                    ORDER BY "num_problems" DESC
                )
            )
        )
    ) AND "condensing_unit_id" IN (
        SELECT "condensing_unit_id" FROM "condensing_unit_lectures"
        WHERE "cooling_system_analysis_id" IN (
            SELECT "cooling_system_analysis_id" FROM "diagnoses"
            WHERE "id" IN (
                SELECT "diagnose_id" FROM (
                    SELECT "diagnose_id", COUNT("probability") AS "num_problems" FROM "problems_probabilities"
                    WHERE "probability" > 2
                    GROUP BY "diagnose_id"
                    ORDER BY "num_problems" DESC
                )
            )
        )
    ) AND "evaporator_id" IN (
        SELECT "evaporator_id" FROM "evaporator_outlet_lectures"
        WHERE "cooling_system_analysis_id" IN (
            SELECT "cooling_system_analysis_id" FROM "diagnoses"
            WHERE "id" IN (
                SELECT "diagnose_id" FROM (
                    SELECT "diagnose_id", COUNT("probability") AS "num_problems" FROM "problems_probabilities"
                    WHERE "probability" > 2
                    GROUP BY "diagnose_id"
                    ORDER BY "num_problems" DESC
                )
            )
        )
    ) AND "expansion_valve_id" IN (
        SELECT "expansion_valve_id" FROM "expansion_valve_inlet_lectures"
        WHERE "cooling_system_analysis_id" IN (
            SELECT "cooling_system_analysis_id" FROM "diagnoses"
            WHERE "id" IN (
                SELECT "diagnose_id" FROM (
                    SELECT "diagnose_id", COUNT("probability") AS "num_problems" FROM "problems_probabilities"
                    WHERE "probability" > 2
                    GROUP BY "diagnose_id"
                    ORDER BY "num_problems" DESC
                )
            )
        )
    )
);


--- OPTIMIZATION
-- Index for companies(company_name) because is used to find the name of the company when the user wants to relate data with the name of a company.
CREATE INDEX "idx_companies_name" ON "companies"("company_name");
-- Index for cooling_systems(company_id) because it is used on subqueries to find condensig_unit_id, compressor_id
CREATE INDEX "idx_cooling_systems_company" ON "cooling_systems"("company_id");
-- Index for cooling_systems for each component to find faster the related parts of a cooling system
CREATE INDEX "idx_cooling_systems_condensing" ON "cooling_systems"("condensing_unit_id");
CREATE INDEX "idx_cooling_systems_compressor" ON "cooling_systems"("compressor_id");
CREATE INDEX "idx_cooling_systems_evaporator" ON "cooling_systems"("evaporator_id");
CREATE INDEX "idx_cooling_systems_expansion" ON "cooling_systems"("expansion_valve_id");
-- Index for diagnoses(cooling_system_analysis_id) because it is used in “WHERE diagnose_id” to relate a determined analysis with the diagnoses and filter the “problems_possibilities” table
CREATE INDEX idx_diagnoses_cooling_system ON "diagnoses"("cooling_system_analysis_id");
-- Index for problems_probabilities(diagnose_id, probability) to improve the search and the order by on a frequent query like looking in “problems_possibilities” table
CREATE INDEX idx_problems_probabilities_diagnose ON "problems_probabilities"("diagnose_id", "probability" DESC);
-- Index for lectures that are filtered by cooling_system_analysis_id
CREATE INDEX idx_compressor_lectures_analysis ON "compressor_lectures"("cooling_system_analysis_id");
CREATE INDEX idx_expansion_lectures_analysis ON "expansion_valve_inlet_lectures"("cooling_system_analysis_id");
CREATE INDEX idx_evaporator_lectures_analysis ON "evaporator_outlet_lectures"("cooling_system_analysis_id");
CREATE INDEX idx_condensing_lectures_analysis ON "condensing_unit_lectures"("cooling_system_analysis_id");

