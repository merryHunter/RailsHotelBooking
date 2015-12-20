# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(:number => 3,
            :persons => 2,
            :type_id =>1,
            :price => 500
)

Room.create(:number => 4,
            :persons => 3,
            :type_id =>1,
            :price => 50
)

Room.create(:number => 5,
            :persons => 5,
            :type_id =>2,
            :price => 100
)

Room.create(:number => 6,
            :persons => 1,
            :type_id =>3,
            :price => 5000
)

Room.create(:number => 7,
            :persons => 2,
            :type_id =>2,
            :price => 200
)

Room.create(:number => 8,
            :persons => 2,
            :type_id =>1,
            :price => 80
)

Room.create(:number => 9,
            :persons => 3,
            :type_id =>3,
            :price => 120
)

Room.create(:number => 10,
            :persons => 4,
            :type_id =>2,
            :price => 1000
)

Request.create(:user_id => 1,
               :type_id => 2,
               :name => 'MyName1',
               :persons => 3,
               :entry => '2015-12-20',
               :final => '2015-12-30'
)
Request.create(:user_id => 1,
               :type_id => 3,
               :name => 'MyName2',
               :persons => 1,
               :entry => '2015-12-20',
               :final => '2015-12-30'
)
Request.create(:user_id => 1,
               :type_id => 2,
               :name => 'MyName3',
               :persons => 4,
               :entry => '2015-12-20',
               :final => '2015-12-30'
)
Request.create(:user_id => 1,
               :type_id => 1,
               :name => 'MyName4',
               :persons => 1,
               :entry => '2015-12-20',
               :final => '2015-12-30'
)
Request.create(:user_id => 1,
               :type_id => 2,
               :name => 'Myame5',
               :persons => 1,
               :entry => '2015-11-10',
               :final => '2015-11-31'
)
Request.create(:user_id => 1,
               :type_id => 1,
               :name => 'MyName6',
               :persons => 2,
               :entry => '2015-11-20',
               :final => '2015-11-30'
)
Request.create(:user_id => 1,
               :type_id => 1,
               :name => 'MyName7',
               :persons => 2,
               :entry => '2015-11-10',
               :final => '2015-11-20'
)

Booking.create(:room_id => 1,
               :user_id => 1,
               :entry => '2015-12-10',
               :final => '2015-12-30'
)
Booking.create(:room_id => 3,
               :user_id => 1,
               :entry => '2015-11-10',
               :final => '2015-11-30'
)
Booking.create(:room_id => 1,
               :user_id => 4,
               :entry => '2015-11-10',
               :final => '2015-11-30'
)
Booking.create(:room_id => 7,
               :user_id => 1,
               :entry => '2015-11-10',
               :final => '2015-11-20'
)
