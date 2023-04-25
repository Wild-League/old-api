# Table Rules

Define all the rules that should be followed in the instance.

**NOTE:** After migration, should alter the column `created_at` to add the default value `CURRENT_DATE`:

[I don't know how to do this with lapis](https://github.com/leafo/lapis/issues/765).

```sql
Alter table rules alter column created_at set default current_date
```

# Fields

## Id
**Description:** Rule id.

**Type:** Int - AutoIncrement

**Version history:** 0.0.1 - added

## Text
**Description:** The rule description

**Type:** Varchar(255)

**Version history:** 0.0.1 - added

## Created_at
**Description:** When this rule was created.

**Type:** Date

**Version history:** 0.0.1 - added

## Updated_at
**Description:** When the rules was updated, null otherwise.

**Type:** Date

**Version history:** 0.0.1 - added
