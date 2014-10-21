import facebook, json, requests

# `      #
  #`.    .+
#    `#  #*
####  **  ####
#    O. O    #                      FUCK FACEBOOK
##### ### ####

g = facebook.GraphAPI( 'CAACEdEose0cBAHN4tID3vZB8dN8tIT17hn9zbNRzz7iMQqP72oUT2X44xZCzx5QEx76j56LMjKIXSI87YdIP72wingxNcXpY58HaZBDOQZBA8C0MtOSnhWzj2dNJgBE3BmDBn5Lwj4kZB7XkXXSvfDAiPAVBsAwIuwuDLhCfRm6STDTbPT9IFtZAqjCkQpsLjNbV5lNwKcQ4097ZCnVhvva' )

dox_group = '146754502180354'            #  https://www.facebook.com/groups/146754502180354/
group_obj = g.get_object( dox_group )

feed_objs = g.get_connections( dox_group, 'feed' , page=True, retry=3, limit=800)

while True:
    try:
            print "Posts: %d" % ( len(feed_objs['data']) )
            with open('doxxx.dump.json','a') as outfile:
                json.dump( feed_objs['data'], outfile, indent = 4 )

            print "Going to next page...  %s " % feed_objs['paging']['next']

            next_page = requests.get(feed_objs['paging']['next'])
            feed_objs = next_page.json()

    except KeyError:
        break
