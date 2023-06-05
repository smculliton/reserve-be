now = DateTime.now

Reservation.create!(email: 'scull@att.net', party_size: 1, time: DateTime.new(now.year, now.month, now.day, 16.5))
Reservation.create!(email: 'scull@att.net', party_size: 1, time: DateTime.new(now.year, now.month, now.day + 7, 15))
Reservation.create!(email: 'scull@att.net', party_size: 1, time: DateTime.new(now.year, now.month, now.day + 5, 20))
Reservation.create!(email: 'scull@att.net', party_size: 1, time: DateTime.new(now.year, now.month, now.day + 3, 19.5))

Hour.create!(weekday_start: 16, weekday_end: 21, weekend_start: 14, weekend_end: 22)