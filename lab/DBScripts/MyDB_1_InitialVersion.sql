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
  primary key ("oid_task")
);


-- WorkerTaskStatus [ent10]
create table "public"."workertaskstatus" (
   "oid_worker"  int4  not null,
   "rewarded"  bool,
  primary key ("oid_worker")
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
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Item_Task [rel1]
create table "public"."item_task" (
   "item_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("item_oid", "task_oid")
);
alter table "public"."item_task"   add constraint fk_item_task_item foreign key ("item_oid") references "public"."item" ("oid_item");
alter table "public"."item_task"   add constraint fk_item_task_task foreign key ("task_oid") references "public"."task" ("oid_task");


-- Annotation_Task [rel12]
alter table "public"."annotation"  add column  "oid"  int4;
alter table "public"."annotation"   add constraint fk_annotation_task foreign key ("oid") references "public"."task" ("oid_task");


-- AnnotationCampain_Item [rel14]
alter table "public"."item"  add column  "oid"  int4;
alter table "public"."item"   add constraint fk_item_annotationcampain foreign key ("oid") references "public"."annotationcampain" ("oid_campaign");


-- Worker_WorkerTaskStatus [rel15]
alter table "public"."workertaskstatus"  add column  "user_oid"  int4;
alter table "public"."workertaskstatus"   add constraint fk_workertaskstatus_worker foreign key ("user_oid") references "public"."worker" ("user_oid");


-- WorkerTaskStatus_Task [rel16]
alter table "public"."workertaskstatus"  add column  "oid"  int4;
alter table "public"."workertaskstatus"   add constraint fk_workertaskstatus_task foreign key ("oid") references "public"."task" ("oid_task");


-- Worker_Skills [rel2]
create table "public"."worker_skills" (
   "worker_oid"  int4 not null,
   "skills_oid"  int4 not null,
  primary key ("worker_oid", "skills_oid")
);
alter table "public"."worker_skills"   add constraint fk_worker_skills_worker foreign key ("worker_oid") references "public"."worker" ("user_oid");
alter table "public"."worker_skills"   add constraint fk_worker_skills_skills foreign key ("skills_oid") references "public"."skills" ("oid_skills");


-- Worker_PiggyBank [rel3]
alter table "public"."piggybank"  add column  "worker_oid"  int4;
alter table "public"."piggybank"   add constraint fk_piggybank_worker foreign key ("worker_oid") references "public"."worker" ("user_oid");


-- Worker_Task [rel4]
create table "public"."worker_task" (
   "worker_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("worker_oid", "task_oid")
);
alter table "public"."worker_task"   add constraint fk_worker_task_worker foreign key ("worker_oid") references "public"."worker" ("user_oid");
alter table "public"."worker_task"   add constraint fk_worker_task_task foreign key ("task_oid") references "public"."task" ("oid_task");


-- Annotation_Item [rel5]
alter table "public"."annotation"  add column  "item_oid_item"  int4;
alter table "public"."annotation"   add constraint fk_annotation_item foreign key ("item_oid_item") references "public"."item" ("oid_item");


-- Worker_Annotation [rel7]
alter table "public"."annotation"  add column  "user_oid"  int4;
alter table "public"."annotation"   add constraint fk_annotation_worker foreign key ("user_oid") references "public"."worker" ("user_oid");


-- AnnotationCampain_Task [rel8]
alter table "public"."task"  add column  "oid"  int4;
alter table "public"."task"   add constraint fk_task_annotationcampain foreign key ("oid") references "public"."annotationcampain" ("oid_campaign");


-- Requester_AnnotationCampain [rel9]
alter table "public"."annotationcampain"  add column  "user_oid"  int4;
alter table "public"."annotationcampain"   add constraint fk_annotationcampain_requester foreign key ("user_oid") references "public"."requester" ("user_oid");


-- GEN FK: Worker --> User
alter table "public"."worker"   add constraint fk_worker_user foreign key ("user_oid") references "public"."user" ("oid");


-- GEN FK: Requester --> User
alter table "public"."requester"   add constraint fk_requester_user foreign key ("user_oid") references "public"."user" ("oid");


