--
-- Copyright 2010-2018 Boxfuse GmbH
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--         http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

CREATE TABLE IF NOT EXISTS  "${schema}"."${table}" (
    "installed_rank" INT NOT NULL,
    "version" VARCHAR(50),
    "description" VARCHAR(2000),
    "type" VARCHAR(50),
    "script" text COLLATE "pg_catalog"."default",
    "checksum" INTEGER,
    "installed_by" VARCHAR(100),
    "installed_on" TIMESTAMP DEFAULT now(),
    "execution_time" INTEGER DEFAULT 0,
    "success" BOOLEAN NOT NULL
);
ALTER TABLE "${schema}"."${table}" ADD CONSTRAINT "${table}_pk" PRIMARY KEY ("installed_rank");

CREATE INDEX "${table}_s_idx" ON "${schema}"."${table}" ("success");
