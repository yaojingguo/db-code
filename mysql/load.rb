#!/usr/bin/env ruby

require "mysql"

m = Mysql.new("127.0.0.1", "root", "Lin123ux", "test")

m.query("DROP TABLE IF EXISTS t")

m.query("CREATE TABLE t (i INT UNSIGNED NOT NULL, PRIMARY KEY(i)) ENGINE=InnoDB")

m.query("SET autocommit=0")

(1..1000000).to_a.shuffle.each_with_index do |i, index|
  m.query("INSERT INTO t (i) VALUES (#{i})")
  puts "Inserted #{index} rows..." if index % 10000 == 0
  m.query("commit")  if index % 10000 == 0
end

m.query("commit")
