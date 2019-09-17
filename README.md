# README

## Introduction

Koroibos is a Ruby on Rails application that provides endpoints for a user to query for information about competitors in the 2016 Summer Olympics.  The application uses olympics data that is imported from a CSV file into the database.  ActiveRecord is used to query the database, based on the information needed for each API endpoint.

The production app is located at https://stormy-lake-75994.herokuapp.com/

## Initial Setup

Clone this repository to your computer.  Once it has been cloned, run `bundle`.  After bundling, run `rake db:{create,migrate}`.  Next, seed the database by running `rake import:olympians`.

## Running Tests

The application was created with RSpec.  To run the test suite, enter `rspec` from the command line.  

SimpleCov was used for monitoring testing coverage.

## How To Use

There are several endpoints in this project.  The first endpoint is used to obtain all of the olympians.  The user makes a GET request to `/api/v1/olympians`.  The response includes all of the competing olympians, including data about their name, team, age, sport and total medals won.  Below is a sample of the response:

```
{
    "olympians": [
        {
            "name": "Andreea Aanei",
            "team": "Romania",
            "age": 22,
            "sport": "Weightlifting",
            "total_medals_won": 0
        },
        {
            "name": "Nstor Abad Sanjun",
            "team": "Spain",
            "age": 23,
            "sport": "Gymnastics",
            "total_medals_won": 0
        },
```

The second endpoint is used to find the youngest olympian.  The user makes a GET request to `/api/v1/olympians?age=youngest`.  The response shows the youngest olympian, with that athlete's name, team, age, sport and total medals won.  Below is a sample response:

```
[
    {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming",
        "total_medals_won": 0
    }
]
```

The third endpoint is used to find the oldest olympian.  The user makes a GET request to `/api/v1/olympians?age=oldest`.  The response shows the oldest olympian, with that athlete's name, team, age, sport and total medals won.  Below is a sample response:

```
[
    {
        "name": "Julie Brougham",
        "team": "New Zealand",
        "age": 62,
        "sport": "Equestrianism",
        "total_medals_won": 0
    }
]
```

## Tech Stack

This application was built using Ruby and Ruby on Rails.  The versions are shown below.

Ruby 2.4.6
Ruby on Rails 5.2.3
PostgreSQL 11.1

## Schema

The database consists of four tables: Athletes, AthleteEvents, Events and Sports.  A diagram of the schema is shown below.

![schema](schema.png)

## Known Issues

## Core Contributors

This was a solo project created by Earl Stephens: https://github.com/earl-stephens

## How to Contribute

If you would desire to contribute to the project, fork the project from the master branch.  You can then make the changes you think are appropriate and submit a pull request.  Please provide a detailed explanation in the pull request of what the problem or fix is.
