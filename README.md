# README

## [Test specification](https://gist.github.com/wwwermishel/fd2c7973520c270c508720ba3a20e09c)

<summary></summary>
<details>
123
</details>

## Steps

```shell
rails new . --skip-test --skip-system-test
bundle add rspec-rails
bundle add rubocop-rspec
bundle add rubocop-rspec_rails
bin/rails generate rspec:install

cat <<EOF >> .rubocop.yml
require:
  - rubocop-rspec
  - rubocop-rspec_rails
EOF

bundle exec rubocop -a
```

```shell
bin/rails g model user
bin/rails g model interest user:references
bin/rails g model skil user:references
bin/rails g migration add_name_to_user name:string
bin/rails db:create db:migrate
```

```shell
bundle add active_interaction
```

```shell
bin/rails g migration add_age_country_email_gender_nationality_patronymic_surname_to_user age:integer country:string email:string gender:string nationality:string patronymic:string surname:string
bin/rails db:migrate
```

### Ответ на вопрос 2:

1. Можно переименовать модель Skil в Skill и убрать в User `class_name: 'Skil'` + написать миграцию для консистентности названий
2. Переименовать модель в Skill и добавить self.table_name = 'skil', чтобы использовать существующую уже таблицу
3. Использовать Inflections `inflect.plural 'skil', 'skills'`

Использую 1 вариант

```shell
bin/rails g migration rename_skils_to_skills
# правлю миграцию
bin/rails db:migrate
```

### Правлю связи
```shell
bin/rails g migration CreateInterestsUsers
bin/rails g migration CreateSkillsUsers
bin/rails g migration remove_user_id_from_skills
bin/rails g migration remove_user_id_from_interests
bin/rails g migration change_email_unique_to_users
bin/rails db:migrate
```

### Добавляю Users::Create из Test specification и начинаем рефакторить
```shell
# приводим код к общему стилю проекта
bundle exec rubocop -a
# Fix typos and naming of skills
# move validations and user_full_name to model User
```

### Добавил создание user a'la API. Проклял немножко ActiveInteraction, в процессе
