-- Task [ent1]
alter table "public"."task"  add column  "minaccuracy"  int4;


-- Skills_Task [rel6]
create table "public"."skills_task" (
   "skills_oid_skills"  int4 not null,
   "task_oid_task"  int4 not null,
  primary key ("skills_oid_skills", "task_oid_task")
);


