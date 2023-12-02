--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Debian 12.16-1.pgdg120+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-12-02 21:21:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "poem-solon";
--
-- TOC entry 3157 (class 1262 OID 16515)
-- Name: poem-solon; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "poem-solon" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


\connect -reuse-previous=on "dbname='poem-solon'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16516)
-- Name: demo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA demo;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16517)
-- Name: gen_table; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.gen_table (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    table_id bigint NOT NULL,
    table_name character varying,
    table_comment character varying,
    sub_table_name character varying,
    sub_table_fk_name character varying,
    class_name character varying,
    tpl_category smallint DEFAULT 0 NOT NULL,
    package_name character varying,
    module_name character varying,
    business_name character varying,
    function_name character varying,
    function_author character varying,
    gen_type character varying DEFAULT 0 NOT NULL,
    gen_path character varying DEFAULT '/'::character varying NOT NULL,
    options character varying,
    remark character varying
);


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE gen_table; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.gen_table IS '代码生成业务表';


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.create_time IS '创建时间';


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.update_time IS '修改时间';


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.create_user IS '创建人';


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.update_user IS '修改人';


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.table_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.table_id IS '主键';


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.table_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.table_name IS '表名称';


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.table_comment; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.table_comment IS '表描述';


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.sub_table_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.sub_table_name IS '关联子表的表名';


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.sub_table_fk_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.sub_table_fk_name IS '子表关联的外键名';


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.class_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.class_name IS '实体类名称';


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.tpl_category; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.tpl_category IS '使用的模板（0:单表操作 1:树表操作）';


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.package_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.package_name IS '生成包路径';


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.module_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.module_name IS '生成模块名';


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.business_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.business_name IS '生成业务名';


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.function_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.function_name IS '生成功能名';


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.function_author; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.function_author IS '生成功能作者';


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.gen_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.gen_type IS '生成代码方式（0zip压缩包 1自定义路径）';


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.gen_path; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.gen_path IS '生成路径（不填默认项目路径）';


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.options; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.options IS '其它生成选项';


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN gen_table.remark; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table.remark IS '备注';


--
-- TOC entry 204 (class 1259 OID 16526)
-- Name: gen_table_column; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.gen_table_column (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    column_id bigint NOT NULL,
    table_id character varying,
    column_name character varying NOT NULL,
    column_comment character varying,
    column_type character varying,
    java_type character varying,
    java_field character varying,
    pk smallint DEFAULT 0 NOT NULL,
    increment smallint DEFAULT 0 NOT NULL,
    required smallint DEFAULT 0 NOT NULL,
    insert smallint DEFAULT 0 NOT NULL,
    edit smallint DEFAULT 0 NOT NULL,
    list smallint DEFAULT 0 NOT NULL,
    query smallint DEFAULT 0 NOT NULL,
    query_type smallint DEFAULT 0 NOT NULL,
    html_type smallint DEFAULT 0 NOT NULL,
    dict_type character varying,
    sort smallint
);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE gen_table_column; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.gen_table_column IS '代码生成业务表字段';


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.create_time IS '创建时间';


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.update_time IS '修改时间';


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.create_user IS '创建人';


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.update_user IS '修改人';


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.column_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.column_id IS '主键';


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.table_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.table_id IS '归属表编号';


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.column_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.column_name IS '列名称';


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.column_comment; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.column_comment IS '列描述';


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.column_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.column_type IS '列类型';


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.java_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.java_type IS 'JAVA类型';


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.java_field; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.java_field IS 'JAVA字段名';


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.pk; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.pk IS '是否主键（0:否 1是）';


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.increment; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.increment IS '是否自增（0:否 1:是）';


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.required; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.required IS '是否必填（0:否 1:是）';


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.insert; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.insert IS '是否为插入字段（0:否 1:是）';


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.edit; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.edit IS '是否编辑字段（0:否 1:是）';


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.list; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.list IS '是否编辑字段（0:否  1:是）';


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.query; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.query IS '是否查询字段（0:否 1是）';


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.query_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.query_type IS '查询方式（0:等于、1:不等于、2:大于、3:小于、4:范围 5:模糊搜索）';


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.html_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.html_type IS '显示类型（0:文本框、1:文本域、2:下拉框、3:复选框、4:单选框、5:日期控件 6:图片上传控件 7:富文本）';


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.dict_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.dict_type IS '字典类型';


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN gen_table_column.sort; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.gen_table_column.sort IS '排序';


--
-- TOC entry 205 (class 1259 OID 16541)
-- Name: poem_dept; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_dept (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    dept_id bigint NOT NULL,
    dept_name character varying NOT NULL,
    parent_dept bigint DEFAULT 0 NOT NULL,
    sort smallint DEFAULT 0 NOT NULL
);


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.create_time IS '创建时间';


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.update_time IS '修改时间';


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.create_user IS '创建人';


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.update_user IS '修改人';


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.dept_id IS '主键';


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.dept_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.dept_name IS '部门名称';


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.parent_dept; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.parent_dept IS '上级部门';


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN poem_dept.sort; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept.sort IS '排序';


--
-- TOC entry 206 (class 1259 OID 16549)
-- Name: poem_dept_ancestors; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_dept_ancestors (
    dept_id bigint NOT NULL,
    ancestors bigint NOT NULL
);


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN poem_dept_ancestors.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept_ancestors.dept_id IS '部门id';


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN poem_dept_ancestors.ancestors; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dept_ancestors.ancestors IS '部门id的上级id和祖级id';


--
-- TOC entry 207 (class 1259 OID 16552)
-- Name: poem_dict_data; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_dict_data (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    dict_code bigint NOT NULL,
    dict_sort smallint DEFAULT 0 NOT NULL,
    dict_label character varying NOT NULL,
    dict_value character varying NOT NULL,
    dict_type character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    remark character varying
);


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE poem_dict_data; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_dict_data IS '字典数据表';


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.create_time IS '创建时间';


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.update_time IS '修改时间';


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.create_user IS '创建人';


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.update_user IS '修改人';


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.dict_code; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.dict_code IS '字典编码';


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.dict_sort; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.dict_sort IS '字典排序';


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.dict_label; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.dict_label IS '字典标签';


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.dict_value; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.dict_value IS '字典值';


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.dict_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.dict_type IS '字典类型';


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.status; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.status IS '字典状态(0:正常 1:停用)';


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN poem_dict_data.remark; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_data.remark IS '备注';


--
-- TOC entry 208 (class 1259 OID 16560)
-- Name: poem_dict_type; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_dict_type (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    dict_type_id bigint NOT NULL,
    dict_name character varying NOT NULL,
    dict_type character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    remark character varying
);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE poem_dict_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_dict_type IS '字典类型';


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.create_time IS '创建时间';


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.update_time IS '修改时间';


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.create_user IS '创建人';


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.update_user IS '修改人';


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.dict_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.dict_name IS '字典名称';


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.dict_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.dict_type IS '字典类型';


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.status; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.status IS '字典状态 0:正常 1:停用';


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN poem_dict_type.remark; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_dict_type.remark IS '备注';


--
-- TOC entry 209 (class 1259 OID 16567)
-- Name: poem_i18n; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_i18n (
    id bigint NOT NULL,
    i18n_key character varying NOT NULL,
    i18n_value character varying NOT NULL,
    language character varying NOT NULL,
    i18n_tag character varying NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint
);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE poem_i18n; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_i18n IS 'i18n数据管理';


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.id IS '主键';


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.i18n_key; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.i18n_key IS 'i18n编码';


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.i18n_value; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.i18n_value IS 'i18n值';


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.language; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.language IS 'i18n地区编码(字典:i18n:language)';


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.i18n_tag; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.i18n_tag IS 'i18n标签(字典:i18n:tag)';


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.create_time IS '创建时间';


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.update_time IS '修改时间';


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.create_user IS '创建人';


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN poem_i18n.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_i18n.update_user IS '修改人';


--
-- TOC entry 210 (class 1259 OID 16573)
-- Name: poem_menu; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_menu (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    menu_id bigint NOT NULL,
    label character varying NOT NULL,
    name character varying,
    path character varying,
    open_type smallint DEFAULT 1 NOT NULL,
    auth character varying,
    parent_menu_id bigint DEFAULT 0,
    type smallint,
    sort smallint DEFAULT 0,
    component character varying,
    icon character varying,
    is_cache smallint DEFAULT 0 NOT NULL,
    is_display smallint DEFAULT 0 NOT NULL,
    is_outside smallint DEFAULT 0 NOT NULL,
    query character varying
);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE poem_menu; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_menu IS '菜单/权限表';


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.create_time IS '创建时间';


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.update_time IS '修改时间';


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.create_user IS '创建人';


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.update_user IS '修改人';


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.label; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.label IS '菜单标题';


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.name IS '菜单名称';


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.path; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.path IS '路由地址';


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.open_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.open_type IS '打开方式 1:当前窗口 2:新窗口';


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.auth; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.auth IS '菜单权限码';


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.parent_menu_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.parent_menu_id IS '上级菜单id';


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.type IS '菜单类型  0:目录 1:侧边菜单 2:按钮';


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.sort; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.sort IS '排序';


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.component; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.component IS '组件路径';


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.icon; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.icon IS '目录图标';


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.is_cache; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.is_cache IS '是否开启缓存 0:关闭  1:开启';


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.is_display; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.is_display IS '是否显示在菜单  0:显示  1:隐藏';


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.is_outside; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.is_outside IS '是否外链  0:否  1:是';


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN poem_menu.query; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_menu.query IS '路由参数';


--
-- TOC entry 211 (class 1259 OID 16585)
-- Name: poem_role; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_role (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    role_id bigint NOT NULL,
    role_name character varying NOT NULL,
    describe character varying,
    role_code character varying NOT NULL,
    data_scope smallint DEFAULT 0 NOT NULL,
    dept_id bigint
);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE poem_role; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_role IS '角色表';


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.create_time IS '创建时间';


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.update_time IS '修改时间';


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.create_user IS '创建人';


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.update_user IS '修改人';


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.role_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.role_id IS '角色id';


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.role_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.role_name IS '角色名';


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.describe; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.describe IS '描述';


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.role_code; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.role_code IS '角色标识';


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.data_scope; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.data_scope IS '数据范围(0:全部数据权限 1:自定数据权限 2:本部门及以下数据权限 3:本部门数据权限 4:仅本人 )';


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN poem_role.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role.dept_id IS '所属部门';


--
-- TOC entry 212 (class 1259 OID 16592)
-- Name: poem_role_dept; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_role_dept (
    role_id bigint NOT NULL,
    dept_id bigint NOT NULL
);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN poem_role_dept.role_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role_dept.role_id IS '角色id';


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN poem_role_dept.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role_dept.dept_id IS '部门id';


--
-- TOC entry 213 (class 1259 OID 16595)
-- Name: poem_role_menu; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_role_menu (
    menu_id bigint NOT NULL,
    role_id bigint NOT NULL
);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE poem_role_menu; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_role_menu IS '角色菜单关系表';


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN poem_role_menu.menu_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role_menu.menu_id IS '菜单id';


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN poem_role_menu.role_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_role_menu.role_id IS '角色id';


--
-- TOC entry 220 (class 1259 OID 16713)
-- Name: poem_tenant; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_tenant (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    tenant_id bigint NOT NULL,
    admin_user bigint,
    describe character varying,
    status smallint DEFAULT 0 NOT NULL,
    expires timestamp without time zone NOT NULL,
    tenant_name character varying NOT NULL,
    group_id bigint NOT NULL
);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE poem_tenant; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_tenant IS '租户信息表';


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.create_time IS '创建时间';


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.update_time IS '修改时间';


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.create_user IS '创建人';


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.update_user IS '修改人';


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.tenant_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.tenant_id IS '租户id';


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.admin_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.admin_user IS '租户管理员';


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.describe; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.describe IS '描述';


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.status; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.status IS '状态(0:正常  1:停用)';


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.expires; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.expires IS '到期时间';


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.tenant_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.tenant_name IS '租户名';


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN poem_tenant.group_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant.group_id IS '权限组id';


--
-- TOC entry 219 (class 1259 OID 16677)
-- Name: poem_tenant_group_menu; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_tenant_group_menu (
    tenant_menu_id bigint NOT NULL,
    group_id bigint NOT NULL
);


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE poem_tenant_group_menu; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_tenant_group_menu IS '商户角色菜单关系表';


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN poem_tenant_group_menu.tenant_menu_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_group_menu.tenant_menu_id IS '菜单id';


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN poem_tenant_group_menu.group_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_group_menu.group_id IS '权限组id';


--
-- TOC entry 217 (class 1259 OID 16659)
-- Name: poem_tenant_menu; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_tenant_menu (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    tenant_menu_id bigint NOT NULL,
    label character varying NOT NULL,
    name character varying,
    path character varying,
    open_type smallint DEFAULT 1 NOT NULL,
    auth character varying,
    parent_tenant_menu_id bigint DEFAULT 0,
    type smallint,
    sort smallint DEFAULT 0,
    component character varying,
    icon character varying,
    is_cache smallint DEFAULT 0 NOT NULL,
    is_display smallint DEFAULT 0 NOT NULL,
    is_outside smallint DEFAULT 0 NOT NULL,
    query character varying
);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE poem_tenant_menu; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_tenant_menu IS '商户菜单表';


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.create_time IS '创建时间';


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.update_time IS '修改时间';


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.create_user IS '创建人';


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.update_user IS '修改人';


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.label; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.label IS '菜单标题';


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.name IS '菜单名称';


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.path; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.path IS '路由地址';


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.open_type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.open_type IS '打开方式 1:当前窗口 2:新窗口';


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.auth; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.auth IS '菜单权限码';


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.parent_tenant_menu_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.parent_tenant_menu_id IS '上级菜单id';


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.type; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.type IS '菜单类型  0:目录 1:侧边菜单 2:按钮';


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.sort; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.sort IS '排序';


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.component; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.component IS '组件路径';


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.icon; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.icon IS '目录图标';


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.is_cache; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.is_cache IS '是否开启缓存 0:关闭  1:开启';


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.is_display; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.is_display IS '是否显示在菜单  0:显示  1:隐藏';


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.is_outside; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.is_outside IS '是否外链  0:否  1:是';


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN poem_tenant_menu.query; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_menu.query IS '路由参数';


--
-- TOC entry 218 (class 1259 OID 16671)
-- Name: poem_tenant_permission_group; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_tenant_permission_group (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    group_id bigint NOT NULL,
    group_name character varying NOT NULL,
    describe character varying
);


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE poem_tenant_permission_group; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_tenant_permission_group IS '商户权限组表';


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.create_time IS '创建时间';


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.update_time IS '修改时间';


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.create_user IS '创建人';


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.update_user IS '修改人';


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.group_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.group_id IS '权限组id';


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.group_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.group_name IS '角色名';


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN poem_tenant_permission_group.describe; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_permission_group.describe IS '描述';


--
-- TOC entry 221 (class 1259 OID 16722)
-- Name: poem_tenant_user; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_tenant_user (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    tenant_user_id bigint NOT NULL,
    user_name character varying NOT NULL,
    account character varying NOT NULL,
    password character varying NOT NULL,
    sex smallint NOT NULL,
    email character varying,
    dept_id bigint,
    language character varying,
    salt character varying,
    tenant_id bigint NOT NULL
);


--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE poem_tenant_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_tenant_user IS '租户用户表';


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.create_time IS '创建时间';


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.update_time IS '修改时间';


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.create_user IS '创建人';


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.update_user IS '修改人';


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.tenant_user_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.tenant_user_id IS '用户id';


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.user_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.user_name IS '用户名';


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.account; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.account IS '账号';


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.password; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.password IS '密码';


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.sex; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.sex IS '性别 0:男性 1:女性 2:其他';


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.email; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.email IS '邮箱';


--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.dept_id IS '部门id';


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.language; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.language IS '语言';


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.salt; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.salt IS '密码加密盐值';


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN poem_tenant_user.tenant_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_tenant_user.tenant_id IS '租户id';


--
-- TOC entry 214 (class 1259 OID 16598)
-- Name: poem_user; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_user (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    user_id bigint NOT NULL,
    user_name character varying NOT NULL,
    account character varying NOT NULL,
    password character varying NOT NULL,
    sex smallint NOT NULL,
    email character varying,
    dept_id bigint,
    language character varying,
    salt character varying
);


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE poem_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.poem_user IS '用户表';


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.create_time IS '创建时间';


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.update_time IS '修改时间';


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.create_user IS '创建人';


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.update_user IS '修改人';


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.user_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.user_id IS '用户id';


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.user_name; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.user_name IS '用户名';


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.account; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.account IS '账号';


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.password; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.password IS '密码';


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.sex; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.sex IS '性别 0:男性 1:女性 2:其他';


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.email; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.email IS '邮箱';


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.dept_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.dept_id IS '部门id';


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.language; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.language IS '语言';


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN poem_user.salt; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user.salt IS '密码加密盐值';


--
-- TOC entry 215 (class 1259 OID 16604)
-- Name: poem_user_role; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.poem_user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN poem_user_role.user_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user_role.user_id IS '用户id';


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN poem_user_role.role_id; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.poem_user_role.role_id IS '角色id';


--
-- TOC entry 216 (class 1259 OID 16607)
-- Name: system_parameter; Type: TABLE; Schema: demo; Owner: -
--

CREATE TABLE demo.system_parameter (
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_user bigint,
    update_user bigint,
    id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    describe character varying
);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE system_parameter; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON TABLE demo.system_parameter IS '系统参数配置';


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.create_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.create_time IS '创建时间';


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.update_time; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.update_time IS '修改时间';


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.create_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.create_user IS '创建人';


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.update_user; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.update_user IS '修改人';


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.key; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.key IS '参数key';


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.value; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.value IS '参数值';


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN system_parameter.describe; Type: COMMENT; Schema: demo; Owner: -
--

COMMENT ON COLUMN demo.system_parameter.describe IS '描述';


--
-- TOC entry 3133 (class 0 OID 16517)
-- Dependencies: 203
-- Data for Name: gen_table; Type: TABLE DATA; Schema: demo; Owner: -
--



--
-- TOC entry 3134 (class 0 OID 16526)
-- Dependencies: 204
-- Data for Name: gen_table_column; Type: TABLE DATA; Schema: demo; Owner: -
--



--
-- TOC entry 3135 (class 0 OID 16541)
-- Dependencies: 205
-- Data for Name: poem_dept; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_dept VALUES ('2023-09-11 15:02:07.115715', NULL, 43511453924630528, NULL, 58737314673807360, '集团名称', 56925072011030528, 0);
INSERT INTO demo.poem_dept VALUES ('2023-09-06 15:00:54.796371', '2023-10-20 11:44:17.03232', 43511453924630528, 43511453924630528, 56925072011030528, 'solon科技集团', 0, 0);


--
-- TOC entry 3136 (class 0 OID 16549)
-- Dependencies: 206
-- Data for Name: poem_dept_ancestors; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_dept_ancestors VALUES (56925072011030528, 0);
INSERT INTO demo.poem_dept_ancestors VALUES (58737314673807360, 56925072011030528);
INSERT INTO demo.poem_dept_ancestors VALUES (58737314673807360, 0);


--
-- TOC entry 3137 (class 0 OID 16552)
-- Dependencies: 207
-- Data for Name: poem_dict_data; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_dict_data VALUES ('2023-10-19 11:35:57.86173', NULL, 43511453924630528, NULL, 72456173201014784, 0, '管理端', 'admin', 'i18n:tag', 0, '管理端标签');
INSERT INTO demo.poem_dict_data VALUES ('2023-10-16 15:08:28.174', '2023-11-02 10:10:11.909748', 43511453924630528, 43511453924630528, 72262584047181824, 0, 'd4', '4', 'dd1', 0, 'd4');
INSERT INTO demo.poem_dict_data VALUES ('2023-10-16 15:08:28.174', '2023-11-02 10:10:11.910747', 43511453924630528, 43511453924630528, 72199365635047424, 0, 'd0', '0', 'dd1', 0, '测试数据');
INSERT INTO demo.poem_dict_data VALUES ('2023-10-16 15:08:28.174', '2023-11-02 10:10:11.91275', 43511453924630528, 43511453924630528, 72199436632031232, 1, 'd1', '1', 'dd1', 0, '测试数据');
INSERT INTO demo.poem_dict_data VALUES ('2023-10-16 15:08:28.174', '2023-11-02 10:13:55.915874', 43511453924630528, 43511453924630528, 72262422537117696, 0, 'd33', '3', 'dd1', 0, 'd3');
INSERT INTO demo.poem_dict_data VALUES ('2023-10-19 11:21:22.964', '2023-11-08 12:55:14.644312', 43511453924630528, 43511453924630528, 72454842784563200, 1, '简体中文', 'zh-CN', 'i18n:language', 0, NULL);
INSERT INTO demo.poem_dict_data VALUES ('2023-10-19 11:21:22.964', '2023-11-08 12:55:21.831333', 43511453924630528, 43511453924630528, 72455199380094976, 0, 'English', 'en', 'i18n:language', 0, '默认,英语国家,排序第一的为默认语言,一般来说需要国际化语言的英语都应作为默认语言');
INSERT INTO demo.poem_dict_data VALUES ('2023-11-19 18:26:46.885', '2023-11-20 15:46:23.979073', 43511453924630528, 43511453924630528, 83793582531940352, 0, '通用', '0', 'saas:script:tag', 0, '通用');


--
-- TOC entry 3138 (class 0 OID 16560)
-- Dependencies: 208
-- Data for Name: poem_dict_type; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_dict_type VALUES ('2023-10-19 11:33:40.479917', NULL, 43511453924630528, NULL, 72455596979142656, '国际化标签', 'i18n:tag', 0, '');
INSERT INTO demo.poem_dict_type VALUES ('2023-10-16 15:08:28.174624', '2023-11-02 10:10:11.890746', 43511453924630528, 43511453924630528, 71422488293068800, 'dd', 'dd1', 0, '测试数据');
INSERT INTO demo.poem_dict_type VALUES ('2023-10-19 11:21:22.964129', '2023-11-08 12:52:47.360447', 43511453924630528, 43511453924630528, 72452503608655872, 'i18n语言编码', 'i18n:language', 0, '维护国际化编码');
INSERT INTO demo.poem_dict_type VALUES ('2023-11-19 18:26:03.663684', '2023-11-20 15:46:23.943798', 43511453924630528, 43511453924630528, 83793401237344256, '商户脚本标签', 'saas:script:tag', 0, '');


--
-- TOC entry 3139 (class 0 OID 16567)
-- Dependencies: 209
-- Data for Name: poem_i18n; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_i18n VALUES (80609225193533440, 'i18n.label.tag', 'i18n tag', 'en', 'admin', '2023-11-10 23:33:16.934321', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80609225248059392, 'i18n.label.tag', 'i18n标签', 'zh-CN', 'admin', '2023-11-10 23:33:16.946394', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80609463887179776, 'i18n.label.pl.tag', 'Please select the I18n label', 'en', 'admin', '2023-11-10 23:34:13.842603', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80609463933317120, 'i18n.label.pl.tag', '请选择I18n标签', 'zh-CN', 'admin', '2023-11-10 23:34:13.853618', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79740293544894464, 'head.language', 'language', 'en', 'admin', '2023-11-08 14:00:27.484428', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79740293616197632, 'head.language', '语言', 'zh-CN', 'admin', '2023-11-08 14:00:27.501648', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79741406612512768, 'systemParameter.button.add', 'Add Configuration', 'en', 'admin', '2023-11-08 14:04:52.860594', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79741406683815936, 'systemParameter.button.add', '添加配置', 'zh-CN', 'admin', '2023-11-08 14:04:52.877707', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79742671513935872, 'common.operate', 'operate', 'en', 'admin', '2023-11-08 14:09:54.436369', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79742671551684608, 'common.operate', '操作', 'zh-CN', 'admin', '2023-11-08 14:09:54.44537', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79743521393172480, 'common.attribute.updateTime', 'Update time', 'en', 'admin', '2023-11-08 14:13:17.063246', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79743521426726912, 'common.attribute.updateTime', '修改时间', 'zh-CN', 'admin', '2023-11-08 14:13:17.072876', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79743462626779136, 'common.attribute.createTime', 'Creation time', 'en', 'admin', '2023-11-08 14:13:03.052421', '2023-11-08 14:14:07.476174', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79743462677110784, 'common.attribute.createTime', '创建时间', 'zh-CN', 'admin', '2023-11-08 14:13:03.064446', '2023-11-08 14:14:07.501149', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79743864252358656, 'common.attribute.describe', 'describe', 'en', 'admin', '2023-11-08 14:14:38.807986', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79743864294301696, 'common.attribute.describe', '描述', 'zh-CN', 'admin', '2023-11-08 14:14:38.817311', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79744051569975296, 'common.attribute.serialNumber', 'Serial Number', 'en', 'admin', '2023-11-08 14:15:23.467159', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79744051624501248, 'common.attribute.serialNumber', '序号', 'zh-CN', 'admin', '2023-11-08 14:15:23.480814', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79747784815108096, 'systemParameter.attribute.key', 'key', 'en', 'admin', '2023-11-08 14:30:13.542987', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79747784873828352, 'systemParameter.attribute.key', '标签', 'zh-CN', 'admin', '2023-11-08 14:30:13.556388', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79747922258255872, 'systemParameter.attribute.value', 'value', 'en', 'admin', '2023-11-08 14:30:46.311159', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79747922308587520, 'systemParameter.attribute.value', '值', 'zh-CN', 'admin', '2023-11-08 14:30:46.323527', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79741747835920384, 'common.button.refreshCache', 'Refresh Cache', 'en', 'admin', '2023-11-08 14:06:14.214964', '2023-11-08 14:42:03.045758', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79741747890446336, 'common.button.refreshCache', '刷新缓存', 'zh-CN', 'admin', '2023-11-08 14:06:14.227903', '2023-11-08 14:42:03.076425', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79739181991419904, 'common.button.edit', 'edit', 'en', 'admin', '2023-11-08 13:56:02.469343', '2023-11-08 14:42:10.141916', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79739182041751552, 'common.button.edit', '编辑', 'zh-CN', 'admin', '2023-11-08 13:56:02.481363', '2023-11-08 14:42:10.168002', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79739283652960256, 'common.button.delete', 'delete', 'en', 'admin', '2023-11-08 13:56:26.707332', '2023-11-08 14:42:12.816884', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79739283703291904, 'common.button.delete', '删除', 'zh-CN', 'admin', '2023-11-08 13:56:26.719651', '2023-11-08 14:42:12.843405', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80611074210508800, 'systemParameter.label.key', 'key', 'en', 'admin', '2023-11-10 23:40:37.773998', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80611074277617664, 'systemParameter.label.key', '配置', 'zh-CN', 'admin', '2023-11-10 23:40:37.789073', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (79741112533082112, 'i18n.button.add', 'Add language', 'en', 'admin', '2023-11-08 14:03:42.746828', '2023-11-08 14:54:24.207365', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79741112587608064, 'i18n.button.add', '添加语言包', 'zh-CN', 'admin', '2023-11-08 14:03:42.760066', '2023-11-08 14:54:24.239477', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79737973608243200, 'common.button.query', 'Query', 'en', 'admin', '2023-11-08 13:51:14.370456', '2023-11-08 14:58:07.577506', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79737973721489408, 'common.button.query', '查 询', 'zh-CN', 'admin', '2023-11-08 13:51:14.39549', '2023-11-08 14:58:07.606466', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79738508688187392, 'common.button.reset', 'Reset', 'en', 'admin', '2023-11-08 13:53:21.941344', '2023-11-08 14:58:15.435106', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (79738508738519040, 'common.button.reset', '重 置', 'zh-CN', 'admin', '2023-11-08 13:53:21.953733', '2023-11-08 14:58:15.46569', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80608383136673792, 'i18n.label.code', 'i18n code', 'en', 'admin', '2023-11-10 23:29:56.174738', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80608383237337088, 'i18n.label.code', 'i18n编码', 'zh-CN', 'admin', '2023-11-10 23:29:56.195155', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80608974571286528, 'i18n.label.pl.code', 'Please enter the i18n encoding', 'en', 'admin', '2023-11-10 23:32:17.180576', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80608974676144128, 'i18n.label.pl.code', '请输入i18n编码', 'zh-CN', 'admin', '2023-11-10 23:32:17.205647', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80611388321935360, 'systemParameter.label.pl.key', 'Please enter the configuration code', 'en', 'admin', '2023-11-10 23:41:52.663959', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80611388384849920, 'systemParameter.label.pl.key', '请输入配置编码', 'zh-CN', 'admin', '2023-11-10 23:41:52.678014', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80613994586943488, 'dept.button.add', 'add dept', 'en', 'admin', '2023-11-10 23:52:14.045676', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80613994649858048, 'dept.button.add', '添加部门', 'zh-CN', 'admin', '2023-11-10 23:52:14.060264', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80614167673286656, 'dept.button.addsub', 'Add Sub Dept', 'en', 'admin', '2023-11-10 23:52:55.312821', '2023-11-10 23:53:48.766293', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80614167732006912, 'dept.button.addsub', '添加子部门', 'zh-CN', 'admin', '2023-11-10 23:52:55.326849', '2023-11-10 23:53:48.801182', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80614742167105536, 'dept.label.name', 'dept name', 'en', 'admin', '2023-11-10 23:55:12.282149', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80614742225825792, 'dept.label.name', '部门名称', 'zh-CN', 'admin', '2023-11-10 23:55:12.296552', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80614866708574208, 'dept.label.pl.name', 'Please enter the department name', 'en', 'admin', '2023-11-10 23:55:41.97519', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80614866771488768, 'dept.label.pl.name', '请输入部门名称', 'zh-CN', 'admin', '2023-11-10 23:55:41.990184', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80615840730820608, 'role.button.power', 'data power', 'en', 'admin', '2023-11-10 23:59:34.200328', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80615840793735168, 'role.button.power', '数据权限', 'zh-CN', 'admin', '2023-11-10 23:59:34.21531', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80616056427098112, 'role.button.add', 'add role', 'en', 'admin', '2023-11-11 00:00:25.62689', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80616056477429760, 'role.button.add', '添加角色', 'zh-CN', 'admin', '2023-11-11 00:00:25.63993', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80619500047151104, 'role.label.name', 'role name', 'en', 'admin', '2023-11-11 00:14:06.649532', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80619500097482752, 'role.label.name', '角色名', 'zh-CN', 'admin', '2023-11-11 00:14:06.661521', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620071160360960, 'role.label.pl.name', 'Please enter a role name', 'en', 'admin', '2023-11-11 00:16:22.81315', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620071210692608, 'role.label.pl.name', '请输入角色名', 'zh-CN', 'admin', '2023-11-11 00:16:22.825756', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620312798408704, 'role.label.code', 'role code', 'en', 'admin', '2023-11-11 00:17:20.424874', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620312869711872, 'role.label.code', '角色码', 'zh-CN', 'admin', '2023-11-11 00:17:20.441474', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620378686730240, 'role.label.pl.code', 'Please enter the character code', 'en', 'admin', '2023-11-11 00:17:36.133897', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80620378741256192, 'role.label.pl.code', '请输入角色码', 'zh-CN', 'admin', '2023-11-11 00:17:36.146168', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80621958400028672, 'common.button.view', 'view', 'en', 'admin', '2023-11-11 00:23:52.766479', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80621958441971712, 'common.button.view', '查看', 'zh-CN', 'admin', '2023-11-11 00:23:52.776999', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622195990573056, 'menu.button.addSub', 'addsub menu', 'en', 'admin', '2023-11-11 00:24:49.412034', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622196036710400, 'menu.button.addSub', '新增子菜单', 'zh-CN', 'admin', '2023-11-11 00:24:49.423528', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622323157676032, 'menu.button.add', 'Add Root Menu', 'en', 'admin', '2023-11-11 00:25:19.731413', '2023-11-11 00:25:53.735929', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80622323216396288, 'menu.button.add', '添加根菜单', 'zh-CN', 'admin', '2023-11-11 00:25:19.74508', '2023-11-11 00:25:53.761729', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80622795096567808, 'menu.label.title', 'title', 'en', 'admin', '2023-11-11 00:27:12.250859', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622795146899456, 'menu.label.title', '标题', 'zh-CN', 'admin', '2023-11-11 00:27:12.262505', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622977875947520, 'menu.label.pl.title', 'Please enter a menu title', 'en', 'admin', '2023-11-11 00:27:55.828258', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80622977930473472, 'menu.label.pl.title', '请输入菜单标题', 'zh-CN', 'admin', '2023-11-11 00:27:55.841501', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623224425525248, 'menu.label.pl.name', 'Please enter a menu name', 'en', 'admin', '2023-11-11 00:28:54.610995', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623224471662592, 'menu.label.pl.name', '请输入菜单名', 'zh-CN', 'admin', '2023-11-11 00:28:54.621953', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623285914021888, 'menu.label.name', 'menu name', 'en', 'admin', '2023-11-11 00:29:09.270923', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623285960159232, 'menu.label.name', '菜单名', 'zh-CN', 'admin', '2023-11-11 00:29:09.281788', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623535709990912, 'menu.label.path', 'path', 'en', 'admin', '2023-11-11 00:30:08.826111', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623535781294080, 'menu.label.path', '路径', 'zh-CN', 'admin', '2023-11-11 00:30:08.843786', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623598179954688, 'menu.label.pl.path', 'Please enter the path', 'en', 'admin', '2023-11-11 00:30:23.720639', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623598221897728, 'menu.label.pl.path', '请输入路径', 'zh-CN', 'admin', '2023-11-11 00:30:23.730904', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80623752173826048, 'menu.label.auth', 'auth', 'en', 'admin', '2023-11-11 00:31:00.435594', '2023-11-11 00:31:07.177758', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80623752236740608, 'menu.label.auth', '权限', 'zh-CN', 'admin', '2023-11-11 00:31:00.450563', '2023-11-11 00:31:07.199997', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80623856247091200, 'menu.label.pl.auth', 'Please enter menu permission', 'en', 'admin', '2023-11-11 00:31:25.248657', '2023-11-11 00:32:14.3335', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80623856289034240, 'menu.label.pl.auth', '请输入菜单权限', 'zh-CN', 'admin', '2023-11-11 00:31:25.258981', '2023-11-11 00:32:14.357649', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (80894289177186304, 'user.button.add', 'Add User', 'en', 'admin', '2023-11-11 18:26:01.484471', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80894289210740736, 'user.button.add', '添加用户', 'zh-CN', 'admin', '2023-11-11 18:26:01.491614', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80899284085739520, 'common.button.submit', 'submit', 'en', 'admin', '2023-11-11 18:45:52.362245', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (80899284089933824, 'common.button.submit', '提交', 'zh-CN', 'admin', '2023-11-11 18:45:52.363485', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81282701964668928, 'dict.label.dictName', 'dict name', 'en', 'admin', '2023-11-12 20:09:26.308878', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81282702128246784, 'dict.label.dictName', '字典名称', 'zh-CN', 'admin', '2023-11-12 20:09:26.346958', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81282768180146176, 'dict.label.pl.dictName', 'Please enter a dictionary name', 'en', 'admin', '2023-11-12 20:09:42.094652', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81282768268226560, 'dict.label.pl.dictName', '请输入字典名称', 'zh-CN', 'admin', '2023-11-12 20:09:42.116026', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283098078932992, 'dict.label.dictType', 'dict type', 'en', 'admin', '2023-11-12 20:11:00.748694', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283098158624768, 'dict.label.dictType', '字典类型', 'zh-CN', 'admin', '2023-11-12 20:11:00.767548', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283249673662464, 'dict.label.pl.dictType', 'Please enter a dictionary name', 'en', 'admin', '2023-11-12 20:11:36.891395', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283249753354240, 'dict.label.pl.dictType', '请输入字典类型', 'zh-CN', 'admin', '2023-11-12 20:11:36.910563', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283490586095616, 'common.label.status', 'status', 'en', 'admin', '2023-11-12 20:12:34.329998', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283490674176000, 'common.label.status', '状态', 'zh-CN', 'admin', '2023-11-12 20:12:34.350998', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283645385273344, 'dict.label.pl.status', 'Please select the dictionary status', 'en', 'admin', '2023-11-12 20:13:11.236692', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81283645553045504, 'dict.label.pl.status', '请选择字典状态', 'zh-CN', 'admin', '2023-11-12 20:13:11.276598', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81284807287173120, 'dict.button.add', 'add dict', 'en', 'admin', '2023-11-12 20:17:48.255193', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81284807345893376, 'dict.button.add', '添加字典', 'zh-CN', 'admin', '2023-11-12 20:17:48.269372', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81286619696263168, 'user.label.deptTree', 'dept tree', 'en', 'admin', '2023-11-12 20:25:00.367432', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81286619746594816, 'user.label.deptTree', '部门树', 'zh-CN', 'admin', '2023-11-12 20:25:00.37973', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81286803268366336, 'user.label.userList', 'user list', 'en', 'admin', '2023-11-12 20:25:44.134547', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81286803348058112, 'user.label.userList', '用户列表', 'zh-CN', 'admin', '2023-11-12 20:25:44.154536', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287060857352192, 'user.label.userName', 'user name', 'en', 'admin', '2023-11-12 20:26:45.548089', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287060958015488, 'user.label.userName', '用户名称', 'zh-CN', 'admin', '2023-11-12 20:26:45.572103', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287281670680576, 'user.label.pl.userName', 'Please enter the user name', 'en', 'admin', '2023-11-12 20:27:38.194262', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287281750372352, 'user.label.pl.userName', '请输入用户名称', 'zh-CN', 'admin', '2023-11-12 20:27:38.213113', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287427145920512, 'user.label.email', 'email', 'en', 'admin', '2023-11-12 20:28:12.878003', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287427221417984, 'user.label.email', '邮箱', 'zh-CN', 'admin', '2023-11-12 20:28:12.896995', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287625960124416, 'user.label.sex', 'sex', 'en', 'admin', '2023-11-12 20:29:00.279964', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287626044010496, 'user.label.sex', '性别', 'zh-CN', 'admin', '2023-11-12 20:29:00.29948', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81287745812361216, 'user.label.pl.sex', 'Please select gender', 'en', 'admin', '2023-11-12 20:29:28.854057', '2023-11-12 20:29:41.22611', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81287745892052992, 'user.label.pl.sex', '请选择性别', 'zh-CN', 'admin', '2023-11-12 20:29:28.873762', '2023-11-12 20:29:41.263178', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81287530011226112, 'user.label.pl.email', 'Please enter email address', 'en', 'admin', '2023-11-12 20:28:37.403754', '2023-11-13 17:12:07.434752', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81287530103500800, 'user.label.pl.email', '请输入邮箱', 'zh-CN', 'admin', '2023-11-12 20:28:37.425984', '2023-11-13 17:12:07.502839', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81285760467922944, 'user.button.resetPassword', 'reset Password', 'en', 'admin', '2023-11-12 20:21:35.511963', '2023-11-13 17:12:17.778357', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81285760560197632, 'user.button.resetPassword', '重置密码', 'zh-CN', 'admin', '2023-11-12 20:21:35.533332', '2023-11-13 17:12:17.803432', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81605282492178432, 'i18n.attribute.key', 'key', 'en', 'admin', '2023-11-13 17:31:15.502067', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81605282584453120, 'i18n.attribute.key', '编码', 'zh-CN', 'admin', '2023-11-13 17:31:15.520375', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81609800269291520, 'common.attribute.sort', 'sort', 'en', 'admin', '2023-11-13 17:49:12.620583', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81609800319623168, 'common.attribute.sort', '排序', 'zh-CN', 'admin', '2023-11-13 17:49:12.632676', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81610209478172672, 'dept.attribute.deptName', 'dept name', 'en', 'admin', '2023-11-13 17:50:50.183865', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81610209532698624, 'dept.attribute.deptName', '部门名称', 'zh-CN', 'admin', '2023-11-13 17:50:50.196161', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81611395098861568, 'common.icon', 'icon', 'en', 'admin', '2023-11-13 17:55:32.857925', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81611395165970432, 'common.icon', '图标', 'zh-CN', 'admin', '2023-11-13 17:55:32.873667', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81615756680093696, 'menu.attribute.path', 'path', 'en', 'admin', '2023-11-13 18:12:52.739113', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81615756751396864, 'menu.attribute.path', '路径', 'zh-CN', 'admin', '2023-11-13 18:12:52.756569', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81615920505413632, 'menu.attribute.component', 'component', 'en', 'admin', '2023-11-13 18:13:31.79885', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81615920568328192, 'menu.attribute.component', '组件', 'zh-CN', 'admin', '2023-11-13 18:13:31.813673', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81616023228112896, 'menu.attribute.auth', 'auth', 'en', 'admin', '2023-11-13 18:13:56.28965', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81616023295221760, 'menu.attribute.auth', '权限码', 'zh-CN', 'admin', '2023-11-13 18:13:56.305468', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81616917281759232, 'common.label.sureDelete', 'Are you sure to delete?', 'en', 'admin', '2023-11-13 18:17:29.448761', '2023-11-13 18:19:03.500317', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81616917336285184, 'common.label.sureDelete', '确认删除吗?', 'zh-CN', 'admin', '2023-11-13 18:17:29.461759', '2023-11-13 18:19:03.53529', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (81617805413048320, 'user.label.account', 'account', 'en', 'admin', '2023-11-13 18:21:01.195236', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81617805471768576, 'user.label.account', '账号', 'zh-CN', 'admin', '2023-11-13 18:21:01.209246', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81617959209787392, 'user.label.deptName', 'dept Name', 'en', 'admin', '2023-11-13 18:21:37.86395', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81617959285284864, 'user.label.deptName', '部门名称', 'zh-CN', 'admin', '2023-11-13 18:21:37.881207', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81623766877966336, 'i18n.pl.trends', 'Please input corresponding value for {0}', 'en', 'admin', '2023-11-13 18:44:42.521238', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81623766970241024, 'i18n.pl.trends', '请输入{0}对应值', 'zh-CN', 'admin', '2023-11-13 18:44:42.541248', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81624985067425792, 'i18n.label.editData', 'Edit Language Pack', 'en', 'admin', '2023-11-13 18:49:32.958566', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81624985117757440, 'i18n.label.editData', '编辑语言包', 'zh-CN', 'admin', '2023-11-13 18:49:32.970568', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81629229677907968, 'common.messages.deleteSuccess', 'delete Success', 'en', 'admin', '2023-11-13 19:06:24.952626', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81629229749211136, 'common.messages.deleteSuccess', '删除成功', 'zh-CN', 'admin', '2023-11-13 19:06:24.970629', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81629642238038016, 'common.message.submitSuccess', 'submit Success', 'en', 'admin', '2023-11-13 19:08:03.31409', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81629642326118400, 'common.message.submitSuccess', '提交成功', 'zh-CN', 'admin', '2023-11-13 19:08:03.33558', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81630295890956288, 'systemParameter.label.edit', 'Edit Configuration', 'en', 'admin', '2023-11-13 19:10:39.157889', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81630295974842368, 'systemParameter.label.edit', '编辑配置', 'zh-CN', 'admin', '2023-11-13 19:10:39.177096', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81630470667603968, 'common.message.refreshSuccess', 'refresh Success', 'en', 'admin', '2023-11-13 19:11:20.827277', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81630470743101440, 'common.message.refreshSuccess', '刷新成功', 'zh-CN', 'admin', '2023-11-13 19:11:20.845515', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81631681739329536, 'systemParameter.attribute.pl.value', 'Please enter configuration values', 'en', 'admin', '2023-11-13 19:16:09.569836', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81631681827409920, 'systemParameter.attribute.pl.value', '请输入配置值', 'zh-CN', 'admin', '2023-11-13 19:16:09.590901', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81632206643892224, 'common.button.reset1', 'resetting', 'en', 'admin', '2023-11-13 19:18:14.716119', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81632206719389696, 'common.button.reset1', '重置', 'zh-CN', 'admin', '2023-11-13 19:18:14.734163', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81632566368374784, 'common.attribute.pl.describe', 'Please enter a description', 'en', 'admin', '2023-11-13 19:19:40.481811', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81632566452260864, 'common.attribute.pl.describe', '请输入描述内容', 'zh-CN', 'admin', '2023-11-13 19:19:40.501114', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680175745282048, 'common.attribute.pl.sort', 'Please sort', 'en', 'admin', '2023-11-13 22:28:51.44394', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680175824973824, 'common.attribute.pl.sort', '请排序', 'zh-CN', 'admin', '2023-11-13 22:28:51.461916', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680726931353600, 'dict.label.add', 'add dict', 'en', 'admin', '2023-11-13 22:31:02.855335', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680726985879552, 'dict.label.add', '添加字典', 'zh-CN', 'admin', '2023-11-13 22:31:02.867562', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680827712090112, 'dict.label.edit', 'edit dict', 'en', 'admin', '2023-11-13 22:31:26.882327', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81680827783393280, 'dict.label.edit', '编辑字典', 'zh-CN', 'admin', '2023-11-13 22:31:26.899975', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681128053616640, 'dictData.button.add', 'Add Dictionary Data', 'en', 'admin', '2023-11-13 22:32:38.489719', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681128108142592, 'dictData.button.add', '添加字典数据', 'zh-CN', 'admin', '2023-11-13 22:32:38.502723', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681414113538048, 'dictData.attribute.dictLabel', 'dict Label', 'en', 'admin', '2023-11-13 22:33:46.691476', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681414159675392, 'dictData.attribute.dictLabel', '字典标签', 'zh-CN', 'admin', '2023-11-13 22:33:46.702989', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681513766006784, 'dictData.attribute.dictValue', 'dict Value', 'en', 'admin', '2023-11-13 22:34:10.450909', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81681513828921344, 'dictData.attribute.dictValue', '字典值', 'zh-CN', 'admin', '2023-11-13 22:34:10.465061', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81682301015896064, 'dictData.label.pl.dictLabel', 'Please enter a dictionary name', 'en', 'admin', '2023-11-13 22:37:18.145122', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81682301078810624, 'dictData.label.pl.dictLabel', '请输入字典名称', 'zh-CN', 'admin', '2023-11-13 22:37:18.16012', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81687732496969728, 'common.label.status.0', 'normal', 'en', 'admin', '2023-11-13 22:58:53.111931', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81687732568272896, 'common.label.status.0', '正常', 'zh-CN', 'admin', '2023-11-13 22:58:53.128941', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81687913485381632, 'common.label.status.1', 'Deactivate', 'en', 'admin', '2023-11-13 22:59:36.262123', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81687913544101888, 'common.label.status.1', '停用', 'zh-CN', 'admin', '2023-11-13 22:59:36.276086', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81689105363972096, 'dictData.label.pl.dictValue', 'Please enter a dictionary value', 'en', 'admin', '2023-11-13 23:04:20.42823', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81689105435275264, 'dictData.label.pl.dictValue', '请输入字典值', 'zh-CN', 'admin', '2023-11-13 23:04:20.44577', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81689315469242368, 'dictData.label.sort', 'dict Sort', 'en', 'admin', '2023-11-13 23:05:10.521567', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81689315519574016, 'dictData.label.sort', '字典排序', 'zh-CN', 'admin', '2023-11-13 23:05:10.533564', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81692022020059136, 'i18n.label.i18nValue', 'i18n value', 'en', 'admin', '2023-11-13 23:15:55.813452', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81692022095556608, 'i18n.label.i18nValue', 'i18n值', 'zh-CN', 'admin', '2023-11-13 23:15:55.831194', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81692116492562432, 'i18n.label.pl.i18nValue', 'Please enter the i18n value', 'en', 'admin', '2023-11-13 23:16:18.337178', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (81692116584837120, 'i18n.label.pl.i18nValue', '请输入i18n值', 'zh-CN', 'admin', '2023-11-13 23:16:18.359181', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84114509727784960, 'script.table.button.add', 'Add Table Script', 'en', 'admin', '2023-11-20 15:42:01.892845', '2023-11-20 15:43:07.201191', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84114509807476736, 'script.table.button.add', '添加表格脚本', 'zh-CN', 'admin', '2023-11-20 15:42:01.91035', '2023-11-20 15:43:07.225716', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84114998523584512, 'script.table.attribute.tableName', 'Table Name', 'en', 'admin', '2023-11-20 15:43:58.429098', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84114998569721856, 'script.table.attribute.tableName', '表名', 'zh-CN', 'admin', '2023-11-20 15:43:58.440626', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84115143541645312, 'script.table.attribute.pl.tableName', 'Please enter a table name', 'en', 'admin', '2023-11-20 15:44:33.004609', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84115143587782656, 'script.table.attribute.pl.tableName', '请输入表名', 'zh-CN', 'admin', '2023-11-20 15:44:33.015581', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84132298811236352, 'script.table.label.add', 'Add Table', 'en', 'admin', '2023-11-20 16:52:43.139614', '2023-11-20 16:53:24.0596', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84132298861568000, 'script.table.label.add', '添加表格', 'zh-CN', 'admin', '2023-11-20 16:52:43.151598', '2023-11-20 16:53:24.083612', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84132673341612032, 'script.table.label.edit', 'Edit Table ', 'en', 'admin', '2023-11-20 16:54:12.434602', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84132673391943680, 'script.table.label.edit', '编辑表格', 'zh-CN', 'admin', '2023-11-20 16:54:12.446619', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133203610689536, 'script.table.label.tableName', 'Table Name', 'en', 'admin', '2023-11-20 16:56:18.860168', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133203661021184, 'script.table.label.tableName', '表名', 'zh-CN', 'admin', '2023-11-20 16:56:18.872147', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133295352700928, 'script.table.label.pl.tableName', 'Please enter a table name', 'en', 'admin', '2023-11-20 16:56:40.733059', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133295403032576, 'script.table.label.pl.tableName', '请输入表名', 'zh-CN', 'admin', '2023-11-20 16:56:40.745057', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133899055652864, 'script.table.label.pl.tag', 'Please select a label', 'en', 'admin', '2023-11-20 16:59:04.667153', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133899097595904, 'script.table.label.pl.tag', '请选择标签', 'zh-CN', 'admin', '2023-11-20 16:59:04.677987', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133951299903488, 'script.table.label.tag', 'tag', 'en', 'admin', '2023-11-20 16:59:17.123096', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84133951346040832, 'script.table.label.tag', '标签', 'zh-CN', 'admin', '2023-11-20 16:59:17.134097', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84137530177871872, 'common.label.pl.status', 'Please select a status', 'en', 'admin', '2023-11-20 17:13:30.394711', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84137530232397824, 'common.label.pl.status', '请选择状态', 'zh-CN', 'admin', '2023-11-20 17:13:30.407782', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84140088426487808, 'i18n.button.copyScript', 'Copy Script', 'en', 'admin', '2023-11-20 17:23:40.328462', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84140088476819456, 'i18n.button.copyScript', '复制脚本', 'zh-CN', 'admin', '2023-11-20 17:23:40.340466', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84141632584671232, 'i18n.label.copySuccess', 'Copy Success', 'en', 'admin', '2023-11-20 17:29:48.484179', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84141632630808576, 'i18n.label.copySuccess', '复制成功', 'zh-CN', 'admin', '2023-11-20 17:29:48.495154', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84506951379554304, 'script.table.label.edit.script', 'Edit Script', 'en', 'admin', '2023-11-21 17:41:27.273708', '2023-11-21 17:52:46.436843', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84506951484411904, 'script.table.label.edit.script', '编辑脚本', 'zh-CN', 'admin', '2023-11-21 17:41:27.29711', '2023-11-21 17:52:46.463671', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (84878400191684608, 'script.table.attribute.ddl', 'DDL Script', 'en', 'admin', '2023-11-22 18:17:27.571953', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84878400267182080, 'script.table.attribute.ddl', 'DDL 脚本', 'zh-CN', 'admin', '2023-11-22 18:17:27.588946', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84881063625056256, 'script.table.attribute.data', 'Data Script', 'en', 'admin', '2023-11-22 18:28:02.582246', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84881063675387904, 'script.table.attribute.data', '数据脚本', 'zh-CN', 'admin', '2023-11-22 18:28:02.594901', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84954362400956416, 'script.table.label.addAttribute', 'Add Attribute', 'en', 'admin', '2023-11-22 23:19:18.372706', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (84954362459676672, 'script.table.label.addAttribute', '添加字段', 'zh-CN', 'admin', '2023-11-22 23:19:18.386254', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (85566414987747328, 'role.label.edit', 'Edit Role', 'en', 'admin', '2023-11-24 15:51:23.081046', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (85566415109382144, 'role.label.edit', '编辑角色', 'zh-CN', 'admin', '2023-11-24 15:51:23.109039', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86697995676299264, 'permissionGroup.button.add', 'Add Permission Group', 'en', 'admin', '2023-11-27 18:47:52.942903', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86697995793739776, 'permissionGroup.button.add', '添加权限组', 'zh-CN', 'admin', '2023-11-27 18:47:52.968908', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86698296907018240, 'permissionGroup.label.edit', 'Edit Permission Group', 'en', 'admin', '2023-11-27 18:49:04.759718', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86698296999292928, 'permissionGroup.label.edit', '编辑权限组', 'zh-CN', 'admin', '2023-11-27 18:49:04.781759', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86709090298347520, 'permissionGroup.label.name', 'Permission Group Name', 'en', 'admin', '2023-11-27 19:31:58.106523', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86709090378039296, 'permissionGroup.label.name', '权限组名称', 'zh-CN', 'admin', '2023-11-27 19:31:58.124532', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88192536866664448, 'common.attribute.expires', 'Expires', 'en', 'admin', '2023-12-01 21:46:39.327', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88192536933773312, 'common.attribute.expires', '到期时间', 'zh-CN', 'admin', '2023-12-01 21:46:39.343463', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88192033634070528, 'tenant.label.name', 'Tenant Name', 'en', 'admin', '2023-12-01 21:44:39.349987', '2023-12-01 21:47:22.897768', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88192033717956608, 'tenant.label.name', '租户名称', 'zh-CN', 'admin', '2023-12-01 21:44:39.367967', '2023-12-01 21:47:22.927768', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88192893554470912, 'tenant.label.pl.name', 'Please Input Tenant Name', 'en', 'admin', '2023-12-01 21:48:04.368455', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88192893625774080, 'tenant.label.pl.name', '请输入租户名称', 'zh-CN', 'admin', '2023-12-01 21:48:04.385366', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88193161318838272, 'tenant.label.add', 'Add Tenant', 'en', 'admin', '2023-12-01 21:49:08.208218', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88193161381752832, 'tenant.label.add', '添加租户', 'zh-CN', 'admin', '2023-12-01 21:49:08.223239', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88236044986085376, 'permissionGroup.label', 'Permission Group', 'en', 'admin', '2023-12-02 00:39:32.472492', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88236045057388544, 'permissionGroup.label', '权限组', 'zh-CN', 'admin', '2023-12-02 00:39:32.488503', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88236482267443200, 'permissionGroup.label.from.pl', 'Please Select Permission Group', 'en', 'admin', '2023-12-02 00:41:16.727827', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88236482321969152, 'permissionGroup.label.from.pl', '请选择权限组', 'zh-CN', 'admin', '2023-12-02 00:41:16.740718', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237193986306048, 'tenant.label.account', 'Account', 'en', 'admin', '2023-12-02 00:44:06.414251', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237194036637696, 'tenant.label.account', '账号', 'zh-CN', 'admin', '2023-12-02 00:44:06.426252', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237298013433856, 'tenant.label.pl.account', 'Please Input Account', 'en', 'admin', '2023-12-02 00:44:31.216134', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237298067959808, 'tenant.label.pl.account', '请输入账号', 'zh-CN', 'admin', '2023-12-02 00:44:31.229054', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237732119703552, 'tenant.label.password', 'Password', 'en', 'admin', '2023-12-02 00:46:14.715248', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237732191006720, 'tenant.label.password', '密码', 'zh-CN', 'admin', '2023-12-02 00:46:14.732239', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237801959059456, 'tenant.label.pl.password', 'Please Input Password', 'en', 'admin', '2023-12-02 00:46:31.366234', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88237802034556928, 'tenant.label.pl.password', '请输入密码', 'zh-CN', 'admin', '2023-12-02 00:46:31.384151', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88238309448871936, 'tenant.label.confirmPassword', 'Confirm Password', 'en', 'admin', '2023-12-02 00:48:32.361023', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88238309503397888, 'tenant.label.confirmPassword', '确认密码', 'zh-CN', 'admin', '2023-12-02 00:48:32.374015', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88238414667182080, 'tenant.label.pl.confirmPassword', 'Please Confirm Password', 'en', 'admin', '2023-12-02 00:48:57.447291', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88238414721708032, 'tenant.label.pl.confirmPassword', '请确认密码', 'zh-CN', 'admin', '2023-12-02 00:48:57.460275', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88240482341613568, 'tenant.label.expires', 'Expiration Time', 'en', 'admin', '2023-12-02 00:57:10.419329', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88240482387750912, 'tenant.label.expires', '到期时间', 'zh-CN', 'admin', '2023-12-02 00:57:10.430313', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88240570887565312, 'tenant.label.pl.expires', 'Please select the expiration date', 'en', 'admin', '2023-12-02 00:57:31.530422', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88240570933702656, 'tenant.label.pl.expires', '请选择到期时间', 'zh-CN', 'admin', '2023-12-02 00:57:31.541398', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88251743963951104, 'tenant.label.re.confirmPassword', 'Two passwords do not match', 'en', 'admin', '2023-12-02 01:41:55.400696', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88251744047837184, 'tenant.label.re.confirmPassword', '两次密码不一致', 'zh-CN', 'admin', '2023-12-02 01:41:55.419698', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (86709452874956800, 'permissionGroup.label.pl.name', 'Please Input Permission Group', 'en', 'admin', '2023-11-27 19:33:24.549371', '2023-12-02 16:12:04.366084', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (86709452963037184, 'permissionGroup.label.pl.name', '请输入权限组名称', 'zh-CN', 'admin', '2023-11-27 19:33:24.570858', '2023-12-02 16:12:04.396068', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88471235348279296, 'permissionGroup.label.menu', 'Menu Permissions', 'en', 'admin', '2023-12-02 16:14:06.223533', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88471235411193856, 'permissionGroup.label.menu', '菜单权限', 'zh-CN', 'admin', '2023-12-02 16:14:06.238534', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88495518736855040, 'tenant.button.info', 'Tenant Info', 'en', 'admin', '2023-12-02 17:50:35.835418', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88495518803963904, 'tenant.button.info', '租户详情', 'zh-CN', 'admin', '2023-12-02 17:50:35.850265', NULL, 43511453924630528, NULL);
INSERT INTO demo.poem_i18n VALUES (88261810196983808, 'common.label.status.!0', 'Enable', 'en', 'admin', '2023-12-02 02:21:55.377684', '2023-12-02 20:05:13.974878', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88261810276675584, 'common.label.status.!0', '启用', 'zh-CN', 'admin', '2023-12-02 02:21:55.395682', '2023-12-02 20:05:14.00089', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88543509623492608, 'common.label.sureSubmit', 'Are you Sure to Submit', 'en', 'admin', '2023-12-02 21:01:17.753055', '2023-12-02 21:01:36.017217', 43511453924630528, 43511453924630528);
INSERT INTO demo.poem_i18n VALUES (88543509690601472, 'common.label.sureSubmit', '确定提交吗', 'zh-CN', 'admin', '2023-12-02 21:01:17.769046', '2023-12-02 21:01:36.043511', 43511453924630528, 43511453924630528);


--
-- TOC entry 3140 (class 0 OID 16573)
-- Dependencies: 210
-- Data for Name: poem_menu; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:09:42.724969', NULL, 43511453924630528, NULL, 61879920510980096, '新增部门', NULL, NULL, 1, 'dept:add', 56521040461266944, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:10:15.708015', NULL, 43511453924630528, NULL, 61880058860097536, '删除部门', NULL, NULL, 1, 'dept:remove', 56521040461266944, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:33:43.079945', NULL, 43511453924630528, NULL, 61885961797746688, '新增角色', NULL, NULL, 1, 'role:add', 54868755092041728, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:36:04.574444', NULL, 43511453924630528, NULL, 61886555274985472, '新增用户', NULL, NULL, 1, 'user:add', 55776168548691968, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:36:22.628288', '2023-09-20 07:36:29.501097', 43511453924630528, 43511453924630528, 61886630998949888, '编辑用户', NULL, NULL, 1, 'user:edit', 55776168548691968, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:37:14.381184', NULL, 43511453924630528, NULL, 61886848066764800, '删除用户', NULL, NULL, 1, 'user:remove', 55776168548691968, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES (NULL, '2023-09-20 07:37:46.333053', NULL, 43511453924630528, 2, '菜单管理', 'menu', 'menu', 1, 'menu', 1, 1, 0, 'system/menu/index.vue', 'menu', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-05 12:15:26.191703', '2023-09-20 07:37:46.33507', 43511453924630528, 43511453924630528, 56521040461266944, '部门管理', 'dept', 'dept', 1, 'dept', 1, 1, 1, 'system/dept/index.vue', 'usergroup', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-08-31 22:49:50.658071', '2023-09-20 07:37:46.33605', 43511453924630528, 43511453924630528, 54868755092041728, '角色管理', 'role', 'role', 1, 'role', 1, 1, 2, 'system/role/index.vue', 'add-circle', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-03 10:55:34.853426', '2023-09-20 07:37:46.337047', 43511453924630528, 43511453924630528, 55776168548691968, '用户管理', 'user', 'user', 1, 'user', 1, 1, 3, 'system/user/index.vue', 'personal-information', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:34:21.246774', '2023-09-20 07:46:53.251336', 43511453924630528, 43511453924630528, 61886121885941760, '编辑角色', NULL, NULL, 1, 'role:edit', 54868755092041728, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:09:59.222276', '2023-09-20 07:47:01.972269', 43511453924630528, 43511453924630528, 61879989708607488, '编辑部门', NULL, NULL, 1, 'dept:edit', 56521040461266944, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 00:02:54.422018', '2023-10-16 00:03:52.343', 43511453924630528, 43511453924630528, 71194596011335680, '编辑菜单', NULL, NULL, 1, 'menu:edit', 2, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 00:03:23.393285', '2023-10-16 00:03:52.343998', 43511453924630528, 43511453924630528, 71194717532905472, '删除菜单', NULL, NULL, 1, 'menu:remove', 2, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 13:49:19.685255', NULL, 43511453924630528, NULL, 71402571640487936, '数据字典', 'dict', 'dict', 1, 'dict', 1, 1, 4, 'system/dict/index.vue', 'address-book', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 13:50:11.321704', '2023-10-25 16:57:30.197491', 43511453924630528, 43511453924630528, 71402788263706624, '新增字典', NULL, NULL, 1, 'dict:add', 71402571640487936, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 13:50:40.957978', '2023-10-25 16:57:30.200493', 43511453924630528, 43511453924630528, 71402912566099968, '编辑字典', NULL, NULL, 1, 'dict:edit', 71402571640487936, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-18 15:33:58.652014', '2023-10-25 16:57:30.201491', 43511453924630528, 43511453924630528, 72153683310071808, '字典数据', 'dictData', 'dictData', 1, 'dict', 71402571640487936, 1, 2, 'system/dict/dictData.vue', '', 0, 1, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-10-16 13:51:09.427797', '2023-10-25 16:57:30.203486', 43511453924630528, 43511453924630528, 71403031977934848, '删除字典', NULL, NULL, 1, 'dict:remove', 71402571640487936, 2, 3, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-08-26 13:48:01.071347', '2023-11-05 13:51:24.46896', 43511453924630528, 43511453924630528, 52920460807962624, '新增菜单', 'addMenu', 'menuFrom', 1, 'menu:add', 2, 2, 0, 'system/menu/menuFrom.vue', 'add-circle', 0, 1, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-09-20 07:34:35.797543', '2023-11-05 13:52:05.638861', 43511453924630528, 43511453924630528, 61886182917259264, '删除角色', NULL, NULL, 1, 'role:remove', 54868755092041728, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 14:58:15.190638', NULL, 43511453924630528, NULL, 78667674553647104, '系统配置', 'systemParameter', 'systemParameter', 1, 'systemParameter', 78652370372997120, 1, 1, 'systemSetting/systemParameter/index.vue', 'setting', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-08-26 20:27:38.199485', '2023-11-28 09:58:16.929467', 43511453924630528, 43511453924630528, 53021028150870016, '菜单详情', 'detailPage', 'detailPage', 1, '', 2, 1, 3, 'system/menu/detailPage.vue', '', 0, 1, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 15:16:22.598757', '2023-11-05 15:17:33.385125', 43511453924630528, 43511453924630528, 78672235477540864, '添加配置', NULL, NULL, 1, 'systemParameter:add', 78667674553647104, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 15:16:38.623969', '2023-11-05 15:17:37.021361', 43511453924630528, 43511453924630528, 78672302695456768, '编辑配置', NULL, NULL, 1, 'systemParameter:edit', 78667674553647104, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 15:16:57.80267', '2023-11-05 15:17:39.646616', 43511453924630528, 43511453924630528, 78672383138013184, '删除配置', NULL, NULL, 1, 'systemParameter:remove', 78667674553647104, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 14:13:00.410588', NULL, 43511453924630528, NULL, 78656287945199616, '新增i18n', NULL, NULL, 1, 'i18n:add', 78652662837620736, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 14:16:20.355666', NULL, 43511453924630528, NULL, 78657126579507200, '编辑i18n', NULL, NULL, 1, 'i18n:edit', 78652662837620736, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 14:16:34.24195', NULL, 43511453924630528, NULL, 78657184821612544, '删除i18n', NULL, NULL, 1, 'i18n:remove', 78652662837620736, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 13:57:26.388083', '2023-11-05 14:40:16.733127', 43511453924630528, 43511453924630528, 78652370372997120, '系统设置', 'systemSetting', 'systemSetting', 1, NULL, 0, 0, 1, 'LAYOUT', 'data-base', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-05 13:58:36.116057', '2023-11-05 14:40:36.561825', 43511453924630528, 43511453924630528, 78652662837620736, '语言包管理', 'i18n', 'i18n', 1, 'i18n', 78652370372997120, 1, 0, 'systemSetting/i18n/index.vue', 'map-grid', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES (NULL, '2023-11-19 20:14:43.710718', NULL, 43511453924630528, 1, '系统管理', 'system', 'system', 1, 'system', 0, 0, 0, 'LAYOUT', 'menu', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-28 09:56:42.049775', '2023-11-28 09:59:00.434049', 43511453924630528, 43511453924630528, 86926707332177920, '菜单详情', 'tenantDetailPage', 'tenantDetailPage', 1, 'tenantMenu', 81889685696999424, 1, 4, 'tenant/menu/detailPage.vue', '', 0, 1, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-14 12:20:20.56532', '2023-11-28 14:12:18.066305', 43511453924630528, 43511453924630528, 81889425893421056, '多租户管理', 'tenantManage', 'tenant', 1, NULL, 0, 0, 2, 'LAYOUT', 'city-6', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-28 14:13:39.429579', NULL, 43511453924630528, NULL, 86991372514975744, '租户管理', 'tenant', 'tenant', 1, 'tenant', 81889425893421056, 1, 2, 'tenant/tenant/index.vue', 'fingerprint-3', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-14 12:21:22.506393', '2023-11-28 09:24:17.577267', 43511453924630528, 43511453924630528, 81889685696999424, '租户菜单管理', 'tenantMenu', 'tenantMenu', 1, 'tenantMenu', 81889425893421056, 1, 0, 'tenant/menu/index.vue', 'calendar-edit', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-12-01 22:22:30.168971', NULL, 43511453924630528, NULL, 88201558143479808, '新增租户', NULL, NULL, 1, 'tenant:add', 86991372514975744, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:07:28.485883', '2023-11-27 18:41:35.940792', 43511453924630528, 43511453924630528, 83033749130211328, '添加商户角色', NULL, NULL, 1, 'permissionGroup:add', 83033564434034688, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:09:48.500262', '2023-11-27 18:41:39.72223', 43511453924630528, 43511453924630528, 83034336395685888, '修改商户角色', NULL, NULL, 1, 'permissionGroup:edit', 83033564434034688, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:10:04.616614', '2023-11-27 18:41:44.372415', 43511453924630528, 43511453924630528, 83034403991089152, '删除商户角色', NULL, NULL, 1, 'permissionGroup:remove', 83033564434034688, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:06:44.452402', '2023-11-28 09:26:07.465406', 43511453924630528, 43511453924630528, 83033564434034688, '租户权限组管理', 'permissionGroup', 'permissionGroup', 1, 'permissionGroup', 81889425893421056, 1, 1, 'tenant/permissionGroup/index.vue', 'usergroup', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:07:51.225882', '2023-11-28 09:49:35.817436', 43511453924630528, 43511453924630528, 83033844508684288, '添加商户菜单', NULL, NULL, 1, 'tenantMenu:add', 81889685696999424, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:08:11.835701', '2023-11-28 09:49:38.831398', 43511453924630528, 43511453924630528, 83033930953289728, '修改商户菜单', NULL, NULL, 1, 'tenantMenu:edit', 81889685696999424, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-11-17 16:09:11.988937', '2023-11-28 09:49:41.946583', 43511453924630528, 43511453924630528, 83034183253258240, '删除商户菜单', NULL, NULL, 1, 'tenantMenu:remove', 81889685696999424, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_menu VALUES ('2023-12-02 02:11:24.133621', NULL, 43511453924630528, NULL, 88259162567790592, '修改租户', NULL, NULL, 1, 'tenant:edit', 86991372514975744, 2, 0, '', '', 0, 0, 0, NULL);


--
-- TOC entry 3141 (class 0 OID 16585)
-- Dependencies: 211
-- Data for Name: poem_role; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_role VALUES ('2023-08-10 16:22:00.297211', '2023-08-11 16:12:08.738062', NULL, NULL, 47161007073583104, '超级管理员', '', 'admin', 0, 56925072011030528);
INSERT INTO demo.poem_role VALUES ('2023-09-18 20:37:47.961258', '2023-09-19 06:10:04.672331', 43511453924630528, 43511453924630528, 61358506599022592, 'admin1', '', '2011', 3, 56925072011030528);
INSERT INTO demo.poem_role VALUES ('2023-08-11 16:12:38.450753', '2023-10-16 00:05:37.298946', 43511453924630528, 43511453924630528, 47521038386257920, '普通用户1', '普通用户', 'normal', 2, 56925072011030528);
INSERT INTO demo.poem_role VALUES ('2023-09-19 06:02:01.424283', '2023-10-16 00:05:48.241063', 61478072612352000, 43511453924630528, 61500498322751488, 'demo1创建的角色', '', 'd1r', 4, 56925072011030528);
INSERT INTO demo.poem_role VALUES ('2023-10-16 00:09:04.477519', NULL, 43511453924630528, NULL, 71196148142891008, 'demo', '1', '1', 4, 56925072011030528);
INSERT INTO demo.poem_role VALUES ('2023-10-21 14:43:22.528032', NULL, 43511453924630528, NULL, 73228112484085760, 'a', '', 'a', 4, 56925072011030528);


--
-- TOC entry 3142 (class 0 OID 16592)
-- Dependencies: 212
-- Data for Name: poem_role_dept; Type: TABLE DATA; Schema: demo; Owner: -
--



--
-- TOC entry 3143 (class 0 OID 16595)
-- Dependencies: 213
-- Data for Name: poem_role_menu; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_role_menu VALUES (1, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (2, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (3, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (43533221221588992, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (43534000628129792, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (43534485992988672, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (43534727018668032, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46109515302531072, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46417473932570624, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46418317331607552, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46418526044368896, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46418690104569856, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46420850162741248, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46421021260984320, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46421125892091904, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46426345619533824, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46426573244411904, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46426810008678400, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46427115974766592, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46427303703425024, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46427606339235840, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46427781212352512, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46427956462956544, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46428489177313280, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46428763027615744, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46429086790135808, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46429210002010112, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46431086542008320, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46433755016933376, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46434100359147520, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46434283155304448, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46434397873713152, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46434491276668928, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (4, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (5, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (6, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46435242463932416, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46436717214773248, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46437512295428096, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46444644046643200, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46444019107930112, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46814807308828672, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46815187094667264, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46815080769060864, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (46814922723491840, 47161007073583104);
INSERT INTO demo.poem_role_menu VALUES (1, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (2, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (52920460807962624, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (56521040461266944, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (54868755092041728, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (55776168548691968, 55773234062618624);
INSERT INTO demo.poem_role_menu VALUES (55776168548691968, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (1, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61886630998949888, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (2, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (71194717532905472, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61885961797746688, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61879920510980096, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61880058860097536, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (71194596011335680, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61886121885941760, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61886555274985472, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61886848066764800, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (54868755092041728, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (52920460807962624, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61886182917259264, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (61879989708607488, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (56521040461266944, 47521038386257920);
INSERT INTO demo.poem_role_menu VALUES (55776168548691968, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (1, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61886630998949888, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (2, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (71194717532905472, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61885961797746688, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61879920510980096, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61880058860097536, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (71194596011335680, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (55776168548691968, 61358506599022592);
INSERT INTO demo.poem_role_menu VALUES (61886121885941760, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61886555274985472, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61886848066764800, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (54868755092041728, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (52920460807962624, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61886182917259264, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (61879989708607488, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (56521040461266944, 61500498322751488);
INSERT INTO demo.poem_role_menu VALUES (0, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (1, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (55776168548691968, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (2, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61886630998949888, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (71194717532905472, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61885961797746688, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61879920510980096, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61880058860097536, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (71194596011335680, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (53021028150870016, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61886121885941760, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61886555274985472, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61886848066764800, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (54868755092041728, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (52920460807962624, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61886182917259264, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (61879989708607488, 71196148142891008);
INSERT INTO demo.poem_role_menu VALUES (56521040461266944, 71196148142891008);


--
-- TOC entry 3150 (class 0 OID 16713)
-- Dependencies: 220
-- Data for Name: poem_tenant; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_tenant VALUES ('2023-12-02 01:53:29.039885', '2023-12-02 20:57:57.977191', 43511453924630528, 43511453924630528, 88254653284188160, 88254653443571712, 'ddd', 0, '2023-12-16 00:00:00', 'ddd', 83781294429302784);


--
-- TOC entry 3149 (class 0 OID 16677)
-- Dependencies: 219
-- Data for Name: poem_tenant_group_menu; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_tenant_group_menu VALUES (0, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (1, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (55776168548691968, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (2, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61886630998949888, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (71194717532905472, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61885961797746688, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61879920510980096, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61880058860097536, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (71194596011335680, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (53021028150870016, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61886121885941760, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61886555274985472, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61886848066764800, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (54868755092041728, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (52920460807962624, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61886182917259264, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (61879989708607488, 83781294429302784);
INSERT INTO demo.poem_tenant_group_menu VALUES (56521040461266944, 83781294429302784);


--
-- TOC entry 3147 (class 0 OID 16659)
-- Dependencies: 217
-- Data for Name: poem_tenant_menu; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:09:42.724', NULL, 43511453924630528, NULL, 61879920510980096, '新增部门', NULL, NULL, 1, 'dept:add', 56521040461266944, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:10:15.708', NULL, 43511453924630528, NULL, 61880058860097536, '删除部门', NULL, NULL, 1, 'dept:remove', 56521040461266944, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:33:43.079', NULL, 43511453924630528, NULL, 61885961797746688, '新增角色', NULL, NULL, 1, 'role:add', 54868755092041728, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:36:04.574', NULL, 43511453924630528, NULL, 61886555274985472, '新增用户', NULL, NULL, 1, 'user:add', 55776168548691968, 2, 0, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:36:22.628', '2023-09-20 07:36:29.501', 43511453924630528, 43511453924630528, 61886630998949888, '编辑用户', NULL, NULL, 1, 'user:edit', 55776168548691968, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:37:14.381', NULL, 43511453924630528, NULL, 61886848066764800, '删除用户', NULL, NULL, 1, 'user:remove', 55776168548691968, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES (NULL, '2023-09-20 07:37:46.333', NULL, 43511453924630528, 2, '菜单管理', 'menu', 'menu', 1, 'menu', 1, 1, 0, 'system/menu/index.vue', 'menu', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-05 12:15:26.191', '2023-09-20 07:37:46.335', 43511453924630528, 43511453924630528, 56521040461266944, '部门管理', 'dept', 'dept', 1, 'dept', 1, 1, 1, 'system/dept/index.vue', 'usergroup', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-08-31 22:49:50.658', '2023-09-20 07:37:46.336', 43511453924630528, 43511453924630528, 54868755092041728, '角色管理', 'role', 'role', 1, 'role', 1, 1, 2, 'system/role/index.vue', 'add-circle', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-03 10:55:34.853', '2023-09-20 07:37:46.337', 43511453924630528, 43511453924630528, 55776168548691968, '用户管理', 'user', 'user', 1, 'user', 1, 1, 3, 'system/user/index.vue', 'personal-information', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:34:21.246', '2023-09-20 07:46:53.251', 43511453924630528, 43511453924630528, 61886121885941760, '编辑角色', NULL, NULL, 1, 'role:edit', 54868755092041728, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:09:59.222', '2023-09-20 07:47:01.972', 43511453924630528, 43511453924630528, 61879989708607488, '编辑部门', NULL, NULL, 1, 'dept:edit', 56521040461266944, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-10-16 00:02:54.422', '2023-10-16 00:03:52.343', 43511453924630528, 43511453924630528, 71194596011335680, '编辑菜单', NULL, NULL, 1, 'menu:edit', 2, 2, 1, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-10-16 00:03:23.393', '2023-10-16 00:03:52.343', 43511453924630528, 43511453924630528, 71194717532905472, '删除菜单', NULL, NULL, 1, 'menu:remove', 2, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-08-26 20:27:38.199', '2023-10-16 00:03:52.344', 43511453924630528, 43511453924630528, 53021028150870016, '菜单详情', 'detailPage', 'detailPage', 1, '', 2, 0, 3, 'system/menu/detailPage.vue', '', 0, 1, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-08-26 13:48:01.071', '2023-11-05 13:51:24.468', 43511453924630528, 43511453924630528, 52920460807962624, '新增菜单', 'addMenu', 'menuFrom', 1, 'menu:add', 2, 2, 0, 'system/menu/menuFrom.vue', 'add-circle', 0, 1, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES ('2023-09-20 07:34:35.797', '2023-11-05 13:52:05.638', 43511453924630528, 43511453924630528, 61886182917259264, '删除角色', NULL, NULL, 1, 'role:remove', 54868755092041728, 2, 2, '', '', 0, 0, 0, NULL);
INSERT INTO demo.poem_tenant_menu VALUES (NULL, '2023-11-05 13:57:36.155', NULL, 43511453924630528, 1, '系统管理', 'system', 'system', 1, 'system', 0, 0, 0, 'LAYOUT', 'brightness', 0, 0, 0, NULL);


--
-- TOC entry 3148 (class 0 OID 16671)
-- Dependencies: 218
-- Data for Name: poem_tenant_permission_group; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_tenant_permission_group VALUES ('2023-11-19 17:37:57.175533', '2023-12-02 20:37:19.944522', 43511453924630528, 43511453924630528, 83781294429302784, '商家', '商家');


--
-- TOC entry 3151 (class 0 OID 16722)
-- Dependencies: 221
-- Data for Name: poem_tenant_user; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_tenant_user VALUES ('2023-12-02 01:53:29.073879', NULL, 43511453924630528, NULL, 88254653443571712, 'dd', 'ddd', 'c47fadd7730919354d506a83be40efcd', 2, NULL, NULL, NULL, '4dbbe7a960774881a19e42480f68531d', 88254653284188160);


--
-- TOC entry 3144 (class 0 OID 16598)
-- Dependencies: 214
-- Data for Name: poem_user; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_user VALUES ('2023-09-19 04:38:33.27902', '2023-11-05 00:20:25.254128', 43511453924630528, 43511453924630528, 61479492635906048, 'demo2', 'demo2', '8aead456e79fa8829bf2d2ea177e5445', 0, '837713748@qq.com', 58737314673807360, NULL, '59efffe60e734b12a8117fc2b653e0a2');
INSERT INTO demo.poem_user VALUES ('2023-08-10 16:23:55.162084', '2023-08-11 16:13:15.012373', 43511453924630528, 43511453924630528, 47161488860700672, 'aaaa', 'aaaa', '8aead456e79fa8829bf2d2ea177e5445', 0, '837713748@qq.com', 56925072011030528, NULL, '59efffe60e734b12a8117fc2b653e0a2');
INSERT INTO demo.poem_user VALUES ('2023-09-19 04:32:54.718347', NULL, 43511453924630528, NULL, 61478072612352000, 'demo', 'demo1', '8aead456e79fa8829bf2d2ea177e5445', 0, '837713748@qq.com', 56925072011030528, NULL, '59efffe60e734b12a8117fc2b653e0a2');
INSERT INTO demo.poem_user VALUES ('2023-07-31 14:39:59.020972', '2023-11-22 18:33:23.649601', NULL, 43511453924630528, 43511453924630528, 'admin', 'admin', '8aead456e79fa8829bf2d2ea177e5445', 0, '', 56925072011030528, 'zh-CN', '59efffe60e734b12a8117fc2b653e0a2');


--
-- TOC entry 3145 (class 0 OID 16604)
-- Dependencies: 215
-- Data for Name: poem_user_role; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.poem_user_role VALUES (43256994949713920, 43149693402112000);
INSERT INTO demo.poem_user_role VALUES (43267318545367040, 43149693402112000);
INSERT INTO demo.poem_user_role VALUES (43271312646848512, 43149693402112000);
INSERT INTO demo.poem_user_role VALUES (43493071414317056, 43276927817465856);
INSERT INTO demo.poem_user_role VALUES (43493071414317056, 43280811122212864);
INSERT INTO demo.poem_user_role VALUES (47161488860700672, 47521038386257920);
INSERT INTO demo.poem_user_role VALUES (61369900169986048, 47521038386257920);
INSERT INTO demo.poem_user_role VALUES (61374726488489984, 61358506599022592);
INSERT INTO demo.poem_user_role VALUES (61380650506711040, 61358506599022592);
INSERT INTO demo.poem_user_role VALUES (61478072612352000, 47521038386257920);
INSERT INTO demo.poem_user_role VALUES (61479492635906048, 47521038386257920);
INSERT INTO demo.poem_user_role VALUES (61500367217197056, 47521038386257920);
INSERT INTO demo.poem_user_role VALUES (61500367217197056, 61358506599022592);
INSERT INTO demo.poem_user_role VALUES (71048041284894720, 61500498322751488);
INSERT INTO demo.poem_user_role VALUES (71048041284894720, 61358506599022592);
INSERT INTO demo.poem_user_role VALUES (43511453924630528, 47161007073583104);


--
-- TOC entry 3146 (class 0 OID 16607)
-- Dependencies: 216
-- Data for Name: system_parameter; Type: TABLE DATA; Schema: demo; Owner: -
--

INSERT INTO demo.system_parameter VALUES ('2023-11-05 15:57:53.834973', '2023-11-08 14:09:06.147985', 43511453924630528, 43511453924630528, 78682684474470400, 'default_user_password', '123456', 'user default password');


--
-- TOC entry 2969 (class 2606 OID 16614)
-- Name: gen_table_column gen_table_column_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.gen_table_column
    ADD CONSTRAINT gen_table_column_pk PRIMARY KEY (column_id);


--
-- TOC entry 2967 (class 2606 OID 16616)
-- Name: gen_table gen_table_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.gen_table
    ADD CONSTRAINT gen_table_pk PRIMARY KEY (table_id);


--
-- TOC entry 2973 (class 2606 OID 16618)
-- Name: poem_dept_ancestors poem_dept_ancestors_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_dept_ancestors
    ADD CONSTRAINT poem_dept_ancestors_pk PRIMARY KEY (dept_id, ancestors);


--
-- TOC entry 2971 (class 2606 OID 16620)
-- Name: poem_dept poem_dept_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_dept
    ADD CONSTRAINT poem_dept_pk PRIMARY KEY (dept_id);


--
-- TOC entry 2975 (class 2606 OID 16622)
-- Name: poem_dict_data poem_dict_data_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_dict_data
    ADD CONSTRAINT poem_dict_data_pk PRIMARY KEY (dict_code);


--
-- TOC entry 2977 (class 2606 OID 16624)
-- Name: poem_dict_type poem_dict_type_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_dict_type
    ADD CONSTRAINT poem_dict_type_pk PRIMARY KEY (dict_type_id);


--
-- TOC entry 2979 (class 2606 OID 16626)
-- Name: poem_dict_type poem_dict_type_un; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_dict_type
    ADD CONSTRAINT poem_dict_type_un UNIQUE (dict_type);


--
-- TOC entry 2981 (class 2606 OID 16628)
-- Name: poem_i18n poem_i18n_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_i18n
    ADD CONSTRAINT poem_i18n_pk PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 16630)
-- Name: poem_menu poem_menu_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_menu
    ADD CONSTRAINT poem_menu_pk PRIMARY KEY (menu_id);


--
-- TOC entry 2988 (class 2606 OID 16632)
-- Name: poem_role_dept poem_role_dept_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_role_dept
    ADD CONSTRAINT poem_role_dept_pk PRIMARY KEY (role_id, dept_id);


--
-- TOC entry 2990 (class 2606 OID 16634)
-- Name: poem_role_menu poem_role_menu_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_role_menu
    ADD CONSTRAINT poem_role_menu_pk PRIMARY KEY (menu_id, role_id);


--
-- TOC entry 2986 (class 2606 OID 16636)
-- Name: poem_role poem_role_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_role
    ADD CONSTRAINT poem_role_pk PRIMARY KEY (role_id);


--
-- TOC entry 3004 (class 2606 OID 16710)
-- Name: poem_tenant_group_menu poem_tenant_group_menu_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_tenant_group_menu
    ADD CONSTRAINT poem_tenant_group_menu_pk PRIMARY KEY (tenant_menu_id, group_id);


--
-- TOC entry 3000 (class 2606 OID 16712)
-- Name: poem_tenant_menu poem_tenant_menu_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_tenant_menu
    ADD CONSTRAINT poem_tenant_menu_pk PRIMARY KEY (tenant_menu_id);


--
-- TOC entry 3002 (class 2606 OID 16708)
-- Name: poem_tenant_permission_group poem_tenant_permission_group_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_tenant_permission_group
    ADD CONSTRAINT poem_tenant_permission_group_pk PRIMARY KEY (group_id);


--
-- TOC entry 3006 (class 2606 OID 16729)
-- Name: poem_tenant poem_tenant_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_tenant
    ADD CONSTRAINT poem_tenant_pk PRIMARY KEY (tenant_id);


--
-- TOC entry 2992 (class 2606 OID 16638)
-- Name: poem_user poem_user_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_user
    ADD CONSTRAINT poem_user_pk PRIMARY KEY (user_id);


--
-- TOC entry 2996 (class 2606 OID 16640)
-- Name: poem_user_role poem_user_role_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_user_role
    ADD CONSTRAINT poem_user_role_pk PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2994 (class 2606 OID 16642)
-- Name: poem_user poem_user_un; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.poem_user
    ADD CONSTRAINT poem_user_un UNIQUE (account);


--
-- TOC entry 2998 (class 2606 OID 16644)
-- Name: system_parameter system_parameter_pk; Type: CONSTRAINT; Schema: demo; Owner: -
--

ALTER TABLE ONLY demo.system_parameter
    ADD CONSTRAINT system_parameter_pk PRIMARY KEY (id);


--
-- TOC entry 2982 (class 1259 OID 16645)
-- Name: poem_i18n_unique; Type: INDEX; Schema: demo; Owner: -
--

CREATE UNIQUE INDEX poem_i18n_unique ON demo.poem_i18n USING btree (i18n_key, i18n_tag, language);


-- Completed on 2023-12-02 21:21:39

--
-- PostgreSQL database dump complete
--

