---
title: "Understanding Apache Calcite (In Progress)"
meta_title: ""
description: "Notes on apache calcite, mainly focusing on adapters and optimizers"
date: 2023-12-30
categories: ["Developer Notes", "Database System", "Database Optimization"]
author: "Satyam Jay"
tags: ["research", "database", "notes"]
draft: false
---


#### [Official Website](https://calcite.apache.org)

## What is it?

To quote it's own documentation "It is a dynamic data management framework".

It contains many of the pieces that comprise a typical database management system,
but omits some key functions: `storage of data`, `algorithms to process data`,
and a `repository for storing metadata`.

It is an opensource project maintained by Apache and written in Java for easy
interface/compatibility with JDBC, and other Apache projects,
which are also mostly JVM based.


## Why does this exists?

Say you have a data store system, and you want to be able to query it using
SQL. You might already have a custom query language but you also want to
support SQL.
To do this you will have to write

  1) SQL parser
  2) Relational Algebra Generator
  3) Query Optimizer
  4) Adapter that can execute those queries on the custom data store.

With Calcite, you only have to build the adapter, rest is taken care by Calcite.

## How does it do it?

---

### Chapter 1:- Adapter Interface

#### model.json:- The entrypoint

To connect with the DB, we must provide a JDBC url.
`connect jdbc:calcite:model=src/test/resources/model.json admin admin`.
Here we are connecting with calcite, and calcite will use `model.json`
to initialize the adapter. Let's look at `model.json`

```json
{
  version: '1.0',
  defaultSchema: 'SALES',
  schemas: [
    {
      name: 'SALES',
      type: 'custom',
      factory: 'org.apache.calcite.adapter.csv.CsvSchemaFactory',
      operand: {
        directory: 'sales'
      }
    }
  ]
}
```

Calcite will call `CsvSchemaFactory.createSchema()` to create schemas.
`createSchema` will be provided with the `operands` specified in the json.
`createSchema()` must return `Schema` object. Remember that a
RDB schema can have multiple tables, following the same logic,
the `Schema` must provide `createTableMap`. This method will return a mapping
`TableName -> Table`. Calcite will use this mapping to locate table
specified in the SQL query. In this example, `CsvSchema` will create a
`Table` corresponding to each csv file in the 'sales' directory.

##### Specifying table without schema

There is also an option of specifying `TableFactory` instead of `SchemaFactory`.

```json
{
  version: '1.0',
  defaultSchema: 'CUSTOM_TABLE',
  schemas: [
    {
      name: 'CUSTOM_TABLE',
      tables: [
        {
          name: 'EMPS',
          type: 'custom',
          factory: 'org.apache.calcite.adapter.csv.CsvTableFactory',
          operand: {
            file: 'sales/EMPS.csv.gz',
            flavor: "scannable"
          }
        }
      ]
    }
  ]
}
```

`CsvTableFactory` will provide `create()` method which will return a `CsvTable`,
given the operand.

#### How will Calcite query the ***Table*** ?


---

### Chapter 2:- Understanding Optimization in Calcite

