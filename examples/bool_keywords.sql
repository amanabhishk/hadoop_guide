insert overwrite directory 'hdfs://hadoop1.cs.wisc.edu:8020/user/aabhishek/keywords'
  
SELECT

id_str,
created_at,
user.id_str,
regexp_replace(user.name, '[\\s]+', " "),
user.screen_name,
regexp_replace(user.description, '[\\s]+', " "),
user.followers_count,
user.friends_count,
user.verified,
geo.type,
geo.coordinates,
regexp_replace(text, '[\\s]+', " "),
retweeted_status.id_str,
retweeted_status.created_at,
retweeted_status.user.id_str,
regexp_replace(retweeted_status.user.name, '[\\s]+', " "),
retweeted_status.user.screen_name,
regexp_replace(retweeted_status.user.description, '[\\s]+', " "),
retweeted_status.user.followers_count,
retweeted_status.user.friends_count,
retweeted_status.user.verified,
retweeted_status.geo.type,
retweeted_status.geo.coordinates,
regexp_replace(retweeted_status.text, '[\\s]+', " ")

FROM gh_rc

WHERE

(
    year = 2012 and month = 3 and day < 15 and
    (
		((
			lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% wi %" or 
			lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% wisconsin %" or
			lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#wi %" or
			lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#wisconsin %" 
    	) or
    	( 
    		lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% barrett %" or
    		lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% thompson %" or
    		lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% walker %" or
    		lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "% recall %"    
		))
        and
        (
            lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#p2 %" or
            lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#tcot %" or
            lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#p2b %" or
            lower(concat(' ', coalesce(text, ' '), ' ', coalesce(retweeted_status.text, ' '), ' ')) like "%#1u %" or
        )
    )
)
