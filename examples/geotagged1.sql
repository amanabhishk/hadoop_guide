insert overwrite directory 'hdfs://hadoop1.cs.wisc.edu:8020/user/aabhishek/geo1'
SELECT id_str, created_at, user.id_str, regexp_replace(user.name, '[\\s]+', " "), user.screen_name, regexp_replace(user.description, '[\\s]+', " "), user.followers_count, user.friends_count, user.verified, geo.type, geo.coordinates, regexp_replace(text, '[\\s]+', " "), retweeted_status.id_str, retweeted_status.created_at, retweeted_status.user.id_str, regexp_replace(retweeted_status.user.name, '[\\s]+', " "),retweeted_status.user.screen_name, regexp_replace(retweeted_status.user.description, '[\\s]+', " "), retweeted_status.user.followers_count, retweeted_status.user.friends_count, retweeted_status.user.verified, retweeted_status.geo.type, retweeted_status.geo.coordinates, regexp_replace(retweeted_status.text, '[\\s]+', " ")
FROM gh_rc
WHERE year = 2012 and month = 5 and  
geo.type like "Point" and  (geo.coordinates[0]<47.31 and geo.coordinates[0]>42.49) and (geo.coordinates[1]>-92.89 and geo.coordinates[1]<-86.25);


