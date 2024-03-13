;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  File name  : Eventify.clp
;;;  Purpose    : This CLIPS source file runs a program to determine a
;;;               location for the user based on their answers to 
;;;               specific questions about their needs.
;;;  Project    : CMSI 627
;;;  Date       : 14-Feb-2024
;;;  Author     : Brittany, Christine, Alejandro, Subhraneel
;;;  Description: This program is just a simple question-and-answer
;;;                session, which will tell the user an event that they
;;;                can attend based on their specifications.
;;;
;;;  Operation  : This source file is intended to be run from the batch
;;;                file with the corresponding name.  To do this, in
;;;                the CLIPS environment, use the command:
;;;
;;;                   (batch Eventify.bat)
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Revision History:
;;;  -----------------
;;;
;;;   Ver      Date      Modified by:  Description
;;;  -----  -----------  ------------  ---------------------------------
;;;  1.0.0  14-Feb-2024  Brittany S.   Initial release
;;;  1.0.1  18-Feb-2024  Subhraneel P  Added a template for location & added locations as facts
;;;  1.0.2  12-Mar-2024  Christine L.  Added rules 
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a template for a location, containing slots for its 
;;;  pertinent information.
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deftemplate location
        (slot name (type STRING))
        (slot address (type STRING))
        (slot hours)
        (slot website)
        (slot description (type STRING))
        (slot region)
        (slot price)
        (slot group_size)
        (slot energy)
        (slot foodAvailable)
        (slot alcoholAvailable)
        (slot musicAvailable)
        (slot wheelchairAccessible)
        (slot category)
        (slot isIndoor)
    )


;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a list of locations, containing the appropriate attribute 
;;;  data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deffacts location-database 
       (location (name "Boardwalk11")
                      (address "10433 National Blvd Los Angeles, CA 90034")
                      (hours 5:00pm-2:00am)
                      (website Boardwalk11.com)
                      (description "indoor")
                      (region SoCal)
                      (price Medium)
                      (group_size any)
                      (energy medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "The Grove")
                      (address "189 The Grove Dr, Los Angeles CA 90036")
                      (hours 10:00am-9:00pm)
                      (website Thegrovela.com)
                      (description "Retail and entertainment complex in Los Angeles.")
                      (region SoCal)
                      (price Medium-High)
                      (group_size any)
                      (energy medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Pier 39")
                      (address "The embarcadero, San Francisco CA 94133")
                      (hours 11:00am-9:00pm)
                      (website Pier39.com)
                      (description "Shopping center with attractions and live shows")
                      (region Bay-area)
                      (price Low-Medium)
                      (group_size any)
                      (energy Medium-High)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Golden Gate Park")
                      (address "501 Stanyan St, San Francisco CA 94117")
                      (hours 6:00am-10:00pm)
                      (website Sfrecpark.org)
                      (description "Large urban park consisting of 1,017 acres of public grounds")
                      (region Bay-area)
                      (price Low-Medium)
                      (group_size any)
                      (energy Low-Medium)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "BigFoot West")
                      (address "10939 Venice Blvd, Los Angeles, CA 90064")
                      (hours 5pm-2am)
                      (website 1933group.com/bigfoot-west)
                      (description "A friendly neighborhood bar with a 'Cheers'-like sensibility, this cozy log cabin transports eager Angelenos to grandpa's cabin at story time")
                      (region SoCal)
                      (price Low)
                      (group_size any)
                      (energy Medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "The Fillmore")
                      (address "1805 Geary Blvd, San Francisco, CA 94115")
                      (hours 10am-6pm)
                      (website livenation.com/venue/KovZpZAE6eeA/the-fillmore-events)
                      (description "The Fillmore is a historic music venue in San Francisco, California")
                      (region Bay-area)
                      (price High)
                      (group_size any)
                      (energy Medium)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Manhattan Beach Pier")
                      (address "2 Manhattan Beach Blvd, Manhattan Beach, CA 90266")
                      (hours 24hrs)
                      (website manhattanbeach.gov)
                      (description "Manhattan Beach Pier is a real gem to photograph as it has a photogenic red-roofed roundhouse at the end of it and turquoise colored steel railings running the length of it. Palm trees line the parking lot at the start of the pier to complete the scene")
                      (region SoCal)
                      (price Low)
                      (group_size any)
                      (energy Low)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Universal CityWalk")
                      (address "100 Universal City Plaza, Universal City, CA 91608")
                      (hours 11am-9pm)
                      (website universalstudioshollywood.com/web/en/us/things-to-do/lands/citywalk)
                      (description "Shops, bars and restaurants")
                      (region SoCal)
                      (price Medium)
                      (group_size 30)
                      (energy High)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Oak Grove")
                      (address "3067 E Chevy Chase Drive, Glendale")
                      (hours request)
                      (website thebash.com/profiles/chevy-chase-country-club-oak-grove)
                      (description "private venue outdoors")
                      (region SoCal)
                      (price Medium)
                      (group_size 40)
                      (energy Low)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable request)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "K1 Indoor Karting Burbank")
                      (address "960 Chestnut st., Burbank, CA 91506")
                      (hours 12pm-10pm)
                      (website k1speed.com/burbank-location.html)
                      (description "Karting for kids and adults, 1 challening indoor track and space for a fun or formal event")
                      (region SoCal)
                      (price High)
                      (group_size 40)
                      (energy High)
                      (foodAvailable request)
                      (alcoholAvailable request)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Academy")
                      (address "6021 Hollywood Blvd, Los Angeles, CA 90028")
                      (hours request)
                      (website academy.la)
                      (description "")
                      (region SoCal)
                      (price Medium)
                      (group_size Any)
                      (energy High)
                      (foodAvailable no)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Bubble World")
                      (address "1345 N. Montebello Boulevard, Montebello")
                      (hours 10am-9pm)
                      (website bubbleworldexperience.com/los-angeles/)
                      (description "Discover uniquely-themed rooms with plenty of photo opportunities in ball pits, VR tech, hot air balloon simulators and illusions")
                      (region SoCal)
                      (price Medium)
                      (group_size Any)
                      (energy Medium-High)
                      (foodAvailable request)
                      (alcoholAvailable request)
                      (musicAvailable request)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
   )
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the group size from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-group_size 
      (not (group_size ?))
   =>
      (printout t "What is your group size? ")
      (assert (group_size (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the price range from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-price
   =>   
      (printout t "What is your price range?" crlf
                  "(Low, Medium, High)" crlf
                  "   [Enter] =>")
      (assert (price (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the energy level from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   (defrule energy 
   =>   
      (printout t "What energy level are you looking for?" crlf
                  "(Low, Medium, High)" crlf
                  "   [Enter] =>")
      (assert (energy (read)))
   )


;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to output the result of the search
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule print-results
      (price      ?price)
      (energy     ?energy)
      (group_size ?group_size)
      (location   (name ?name)
                  (price ?price)
                  (energy ?energy)
                  (group_size ?group_size)
       )
      =>
      (printout t crlf crlf)
      (printout t "The best match for you is " ?name " venue.")
      (printout t crlf crlf crlf)
   )
