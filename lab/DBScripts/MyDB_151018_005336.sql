-- WorkerTaskStatus [ent10]
alter table "public"."workertaskstatus"  add column  "oid_status_2"  int4  not null;


-- Worker [ent4]
alter table "public"."worker"  add column  "tasksdone"  int4;
alter table "public"."worker"  add column  "taskssatisfied"  int4;


-- Worker_WorkerTaskStatus [rel15]
alter table "public"."workertaskstatus"  add column  "user_oid"  int4;


-- WorkerTaskStatus_Task [rel16]
alter table "public"."workertaskstatus"  add column  "oid"  int4;


