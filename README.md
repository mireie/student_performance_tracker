# Student Performance Tracker

#### **A web application designed for educators to keep track of their students' scores**.
Live Demo: https://epi-spt-demo.herokuapp.com/


#### Contributions By:

* _Andrew Giang <giang184[at]gmail[dot]com>_
* _Kristen Hopper <hopperdavis[at]gmail[dot]com>_
* _Arthur Lee <meleearthur[at]gmail[dot]com>_
* _Dave Lindqvist <lindqvist[dot]dave[at]gmail[dot]com>_
* _Michael Reiersgaard <Michael[dot]Reiersgaard[at]gmail[dot]com>_

## Technologies Used

1. Ruby v2.6.6
2. Rails v5.2.6
3. Chart.js + Moment.js
4. Faker
5. Devise
6. Kaminari
7. Bootstrap v5.0.1
8. RSpec
9. Heroku
10. Visual Studio Code

## Description

A web application designed to track student scores on various tests over their time at the school. This implementation was inspired by a school's usage of a Google Spreadsheet for their tracking instead of an in-house website application. The end goal was to replicate and design a website that the school would consider implementing over their current spreadsheet. The majority of the features within the spreadsheet were replicated within this project and includes additional features such as:
  * User activation and authentication
    * Activating/Deactivating students and teachers
  * Average values of students' scores
  * Addition of teachers
  * Setting a one-to-many database relationship with a teacher to students
  * Interactive chart

---

# Setup/Installation Requirements

## Intial Project Setup

* Ruby is required, download and install https://www.ruby-lang.org/en/documentation/installation/
* Bundler is required, install using the terminal with `gem install bundler`
* Ensure PostgreSQL is installed and correctly running on your local machine
* Create a directory to clone the public repository from GitHub using `git clone https://github.com/mireie/student_performance_tracker.git`
* Enter the root of the project directory and install all gems with `bundle install`

## Initializing the Database
- Update the `config/database.yml` file to match your PostgreSQL setup
- Initialize the database with `rake db:create` and initialize tables with `rake db:migrate`
    - If you encounter errors here, your `database.yml` file is likely not set up correctly and you skipped the previous step!
- Seed the database with products and reviews with the terminal command `rake db:seed`

## Running the Application
- To run the site on your local machine in the terminal run `rails s`
- Open your browser and navigate to `localhost:3000` (default configuration)

## Adding admins via the rails console
* To add an admin you must use the rails console with `rails console`
* Add the admin using the following format: `User.create(:email => "test@example.com", :password => "password", :admin => true)`
* You will now be able to login as an admin on the website at `http://localhost:3000/users/sign_in`
* You can also modify an existing user to make an admin with `rails c`. For a known `{user_id}`, run this command in the rails console: `User.find({user_id}).update(:admin => true)`

## Deactivating or activating users
* As an admin, visit the `User Management` portal on the top-right link
* Click on `Toggle Active` to deactivate or activate users from seeing the tracker's contents

---

## Known Bugs
* Please open a pull request if you have any issues!

## License

MIT License

Copyright (c) Andrew Giang, Kristen Hopper, Arthur Lee, Dave Lindqvist, Michael Reiersgaard 2021

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

