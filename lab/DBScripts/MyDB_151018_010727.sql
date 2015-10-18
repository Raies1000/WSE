-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Task [ent1]
create table "public"."task" (
   "oid_task"  int4  not null,
   "expiration"  timestamp,
   "executiontime"  time,
   "reward"  int4,
   "description"  varchar(255),
   "title"  varchar(255),
   "minaccuracy"  int4,
  primary key ("oid_task")
);


-- WorkerTaskStatus [ent10]
create table "public"."workertaskstatus" (
   "oid_status"  int4  not null,
   "done"  bool,
   "satisfactory"  bool,
  primary key ("oid_status")
);


-- Skills [ent2]
create table "public"."skills" (
   "oid_skills"  int4  not null,
   "name"  varchar(255),
  primary key ("oid_skills")
);


-- Item [ent3]
create table "public"."item" (
   "oid_item"  int4  not null,
   "url"  varchar(255),
   "caption"  varchar(255),
   "title"  varchar(255),
  primary key ("oid_item")
);


-- Worker [ent4]
create table "public"."worker" (
   "user_oid"  int4  not null,
   "accuracyscore"  int4,
   "birthdate"  date,
   "name"  varchar(255),
   "tasksdone"  int4,
   "taskssatisfied"  int4,
  primary key ("user_oid")
);


-- PiggyBank [ent5]
create table "public"."piggybank" (
   "oid_bank"  int4  not null,
   "balance"  int4,
  primary key ("oid_bank")
);


-- Annotation [ent6]
create table "public"."annotation" (
   "oid_annotation"  int4  not null,
   "confidence"  int4,
   "label"  varchar(255),
  primary key ("oid_annotation")
);


-- AnnotationCampaign [ent7]
create table "public"."annotationcampain" (
   "oid_campaign"  int4  not null,
   "name"  varchar(255),
   "status"  bool,
   "budget"  int4,
  primary key ("oid_campaign")
);


-- Requester [ent8]
create table "public"."requester" (
   "user_oid"  int4  not null,
   "name"  varchar(255),
  primary key ("user_oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);


-- Item_Task [rel1]
create table "public"."item_task" (
   "item_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("item_oid", "task_oid")
);


-- Annotation_Task [rel12]
alter table "public"."annotation"  add column  "oid"  int4;


-- AnnotationCampain_Item [rel14]
alter table "public"."item"  add column  "oid"  int4;


-- Worker_WorkerTaskStatus [rel15]
alter table "public"."workertaskstatus"  add column  "user_oid"  int4;


-- WorkerTaskStatus_Task [rel16]
alter table "public"."workertaskstatus"  add column  "oid"  int4;


-- Worker_Skills [rel2]
create table "public"."worker_skills" (
   "worker_oid"  int4 not null,
   "skills_oid"  int4 not null,
  primary key ("worker_oid", "skills_oid")
);


-- Worker_PiggyBank [rel3]
alter table "public"."piggybank"  add column  "worker_oid"  int4;


-- Worker_Task [rel4]
create table "public"."worker_task" (
   "worker_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("worker_oid", "task_oid")
);


-- Annotation_Item [rel5]
alter table "public"."annotation"  add column  "item_oid_item"  int4;


-- Skills_Task [rel6]
create table "public"."skills_task" (
   "skills_oid_skills"  int4 not null,
   "task_oid_task"  int4 not null,
  primary key ("skills_oid_skills", "task_oid_task")
);


-- Worker_Annotation [rel7]
alter table "public"."annotation"  add column  "user_oid"  int4;


-- AnnotationCampain_Task [rel8]
alter table "public"."task"  add column  "oid"  int4;


-- Requester_AnnotationCampain [rel9]
alter table "public"."annotationcampain"  add column  "user_oid"  int4;


