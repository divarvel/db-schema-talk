% Clean DB schemas
% Clément Delafargue
% 2014-10-14

-------------------------------------------

<span style="font-size: 5.5em;">λ</span>



# SQL Database schemas
![](assets/schema.jpg)


# Write your schema yourself
![](assets/robot-door.gif)


# DB-agnosticism
![](assets/trap.gif)


# Use postgreSQL
![](assets/elephant-jump.gif)


# Avoid ORMs
![](assets/rube-goldberg.gif)

-------------------------------------------

**But please use data mapping libraries**

Pomm (PHP), anorm / slick (scala), …



# Normal Forms
![](assets/academics.jpg)

# Design with Querying in mind

# Primary Keys

#Use UUIDs

(or random IDs)

# Prevent entity enumeration
![](assets/hacking.gif)

# Prevent growth rate disclosure
![](assets/hacking.gif)

# Avoid linking the wrong table
![](assets/table-flip.gif)


# Default to not null
![](assets/no-value.png)

# Don't fear the join
![](assets/elephants.gif)


-------------------------------------------

**Uniform naming for PKs & FKs**


    <table_name>_id

-------------------------------------------

**Uniform naming for PKs & FKs**

```sqlpostgresql
select <fields> from
  table_1
  inner join table_2
    on table_1.table_1_id =
       table_2.table_2_id
```

-------------------------------------------

**Uniform naming for PKs & FKs**

```sqlpostgresql
select <fields> from
  table_1
  inner join table_2
    using (table_1_id)
```
-------------------------------------------

**Uniform naming for PKs & FKs**

```sqlpostgresql
select <fields> from
  table_1
  natural join table_2
```

-------------------------------------------

**Use enums**

```sqlpostgresql
create type status
as enum('pending', 'validated');
```


-------------------------------------------

**Use rich types**

    inet (IP address)
    timestamp with time zone
    point (2D point)
    tstzrange (time range)
    interval (duration)

-------------------------------------------

**Create your own**

```sqlpostgresql
    create type my type
    as (
        field1 int,
        field2 text
    );
```

-------------------------------------------

**Use arrays**

```sqlpostgresql
    select '{1,2,3}'::int[]
```

-------------------------------------------

**Rich types => powerful constraints**

```sqlpostgresql
create table reservation(
    reservation_id uuid primary key,
    dates tstzrange not null,
    exclude using gist (dates with &&)
);
```
# You can dump K/V data
![](assets/shape-toy.gif)

# You can dump JSON data
![](assets/shape-toy.gif)

-------------------------------------------

**Common Table Expressions**

```sqlpostgresql
with sub_request as (
    select <fields> from table1
)

select <fields> from sub_request;
```

# Shameless Plug


# jDbT

<https://github.com/divarvel/jdbt>

-------------------------------------------

**jDbT**

```yaml
status:
  - Test
  - Prod

member:
  name: text
  email: text
  status: status | 'Test'
  __unique: [ name, email ]
```

-------------------------------------------

**jDbT**

```yaml
post:
  member_id:
  +?title: text
  ?content: text

tag:
    +name: text
    __check: name <> 'forbidden'
```

-------------------------------------------

**jDbT**

```yaml
post_tag:
    post_id:
    tag_id:
    __pk: [ tag_id, post_id ]
```

-------------------------------------------

**jDbT**

![](assets/schema.png)


# Thanks
